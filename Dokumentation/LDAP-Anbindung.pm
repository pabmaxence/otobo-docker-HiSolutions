# ---
# Für die Syncronisation der Agentendaten in die OTOBO DB kann folgender in Block die Config.pm (in den "your own config settings"-Abschnitt) kopiert werden
# ---

    # --------------------------------------------------- #
    # authentication sync settings                        #
    # (enable agent data sync. after succsessful          #
    # authentication)                                     #
    # --------------------------------------------------- #
    # This is an example configuration for an LDAP auth sync. backend.
    # (take care that Net::LDAP is installed!)
#    $Self->{AuthSyncModule} = 'Kernel::System::Auth::Sync::LDAP';
#    $Self->{'AuthSyncModule::LDAP::Host'} = 'ldap.example.com';
#    $Self->{'AuthSyncModule::LDAP::BaseDN'} = 'dc=example,dc=com';
#    $Self->{'AuthSyncModule::LDAP::UID'} = 'uid';
#    $Self->{'AuthSyncModule::LDAP::GroupDN'} = 'cn=otoboallow,ou=posixGroups,dc=example,dc=com';

    # The following is valid but would only be necessary if the
    # anonymous user do NOT have permission to read from the LDAP tree
#    $Self->{'AuthSyncModule::LDAP::SearchUserDN'} = '';
#    $Self->{'AuthSyncModule::LDAP::SearchUserPw'} = '';

    # in case you want to add always one filter to each ldap query, use
    # this option. e. g. AlwaysFilter => '(mail=*)' or AlwaysFilter => '(objectclass=user)'
    # or if you want to filter with a logical OR-Expression, like AlwaysFilter => '(|(mail=*abc.com)(mail=*xyz.com))'
#    $Self->{'AuthSyncModule::LDAP::AlwaysFilter'} = '';

    # AuthSyncModule::LDAP::UserSyncMap
    # (map if agent should create/synced from LDAP to DB after successful login)
    # you may specify LDAP-Fields as either
    #  * list, which will check each field. first existing will be picked ( ["givenName","cn","_empty"] )
    #  * name of an LDAP-Field (may return empty strings) ("givenName")
    #  * fixed strings, prefixed with an underscore: "_test", which will always return this fixed string
#    $Self->{'AuthSyncModule::LDAP::UserSyncMap'} = {
#        # DB -> LDAP
#        UserFirstname => 'givenName',
#        UserLastname  => 'sn',
#        UserEmail     => 'mail',
#    };

    # Net::LDAP new params (if needed - for more info see perldoc Net::LDAP)
#    $Self->{'AuthSyncModule::LDAP::Params'} = {
#        port    => 389,
#        timeout => 120,
#        async   => 0,
#        version => 3,
#    };
    # Net::LDAP::start_tls verify type (if needed - for more info see Net::LDAP::start_tls)
#    $Self->{'AuthSyncModule::LDAP::StartTLS'} = 'required';


    # Die if backend can't work, e. g. can't connect to server.
#    $Self->{'AuthSyncModule::LDAP::Die'} = 1;


# ---
# Wenn OTOBO-Gruppen oder -Rollen aus LDAP-Gruppen synchronisiert werden sollen, können die entsprechenden Abschnitte hier in die Config.pm kopiert und angepasst werden.
# ---


    # Attributes needed for group syncs
    # (attribute name for group value key)
#    $Self->{'AuthSyncModule::LDAP::AccessAttr'} = 'memberUid';
    # (attribute for type of group content UID/DN for full ldap name)
#    $Self->{'AuthSyncModule::LDAP::UserAttr'} = 'UID';
#    $Self->{'AuthSyncModule::LDAP::UserAttr'} = 'DN';

    # AuthSyncModule::LDAP::UserSyncInitialGroups
    # (sync following group with rw permission after initial create of first agent
    # login)
#    $Self->{'AuthSyncModule::LDAP::UserSyncInitialGroups'} = [
#        'users',
#    ];

    # Utilize extended nested group search?
#    $Self->{'AuthSyncModule::LDAP::NestedGroupSearch'} = '1';

    # AuthSyncModule::LDAP::UserSyncGroupsDefinition
    # (If "LDAP" was selected for AuthModule and you want to sync LDAP
    # groups to otobo groups, define the following.)
#    $Self->{'AuthSyncModule::LDAP::UserSyncGroupsDefinition'} = {
#        # ldap group
#        'cn=agent,o=otobo' => {
#            # otobo group
#            'admin' => {
#                # permission
#                rw => 1,
#                ro => 1,
#            },
#            'faq' => {
#                rw => 0,
#                ro => 1,
#            },
#        },
#        'cn=agent2,o=otobo' => {
#            'users' => {
#                rw => 1,
#                ro => 1,
#            },
#        }
#    };

    # AuthSyncModule::LDAP::UserSyncRolesDefinition
    # (If "LDAP" was selected for AuthModule and you want to sync LDAP
    # groups to otobo roles, define the following.)
#    $Self->{'AuthSyncModule::LDAP::UserSyncRolesDefinition'} = {
#        # ldap group
#        'cn=agent,o=otobo' => {
#            # otobo role
#            'role1' => 1,
#            'role2' => 0,
#        },
#        'cn=agent2,o=otobo' => {
#            'role3' => 1,
#        }
#    };

    # AuthSyncModule::LDAP::UserSyncAttributeGroupsDefinition
    # (If "LDAP" was selected for AuthModule and you want to sync LDAP
    # attributes to otobo groups, define the following.)
#    $Self->{'AuthSyncModule::LDAP::UserSyncAttributeGroupsDefinition'} = {
#        # ldap attribute
#        'LDAPAttribute' => {
#            # ldap attribute value
#            'LDAPAttributeValue1' => {
#                # otobo group
#                'admin' => {
#                    # permission
#                    rw => 1,
#                    ro => 1,
#                },
#                'faq' => {
#                    rw => 0,
#                    ro => 1,
#                },
#            },
#        },
#        'LDAPAttribute2' => {
#            'LDAPAttributeValue' => {
#                'users' => {
#                    rw => 1,
#                    ro => 1,
#                },
#            },
#         }
#    };

    # AuthSyncModule::LDAP::UserSyncAttributeRolesDefinition
    # (If "LDAP" was selected for AuthModule and you want to sync LDAP
    # attributes to otobo roles, define the following.)
#    $Self->{'AuthSyncModule::LDAP::UserSyncAttributeRolesDefinition'} = {
#        # ldap attribute
#        'LDAPAttribute' => {
#            # ldap attribute value
#            'LDAPAttributeValue1' => {
#                # otobo role
#                'role1' => 1,
#                'role2' => 1,
#            },
#        },
#        'LDAPAttribute2' => {
#            'LDAPAttributeValue1' => {
#                'role3' => 1,
#            },
#        },
#    };



# ---
# Wenn Kundendaten aus dem AD angezeigt werden sollen
# ---

#    $Self->{CustomerUser} = {
#        Name => 'LDAP Backend',
#        Module => 'Kernel::System::CustomerUser::LDAP',
#        Params => {
#            # ldap host
#            Host => 'bay.csuhayward.edu',
#            # ldap base dn
#            BaseDN => 'ou=seas,o=csuh',
#            # search scope (one|sub)
#            SSCOPE => 'sub',
#            # The following is valid but would only be necessary if the
#            # anonymous user does NOT have permission to read from the LDAP tree
#            UserDN => '',
#            UserPw => '',
#            # in case you want to add always one filter to each ldap query, use
#            # this option. e. g. AlwaysFilter => '(mail=*)' or AlwaysFilter => '(objectclass=user)'
#            AlwaysFilter => '',
#            # if the charset of your ldap server is iso-8859-1, use this:
#            # SourceCharset => 'iso-8859-1',
#            # die if backend can't work, e. g. can't connect to server
#            Die => 0,
#            # Net::LDAP new params (if needed - for more info see perldoc Net::LDAP)
#            Params => {
#                port    => 389,
#                timeout => 120,
#                async   => 0,
#                version => 3,
#            },
#        },
#        # customer unique id
#        CustomerKey => 'uid',
#        # customer #
#        CustomerID => 'mail',
#        CustomerUserListFields => ['cn', 'mail'],
#        CustomerUserSearchFields => ['uid', 'cn', 'mail'],
#        CustomerUserSearchPrefix => '',
#        CustomerUserSearchSuffix => '*',
#        CustomerUserSearchListLimit => 250,
#        CustomerUserPostMasterSearchFields => ['mail'],
#        CustomerUserNameFields => ['givenname', 'sn'],
#        # Configures the character for joining customer user name parts. Join single space if it is not defined.
#        CustomerUserNameFieldsJoin => ' ',
#        # show customer user and customer tickets in customer interface
#        CustomerUserExcludePrimaryCustomerID => 0,
#        # add a ldap filter for valid users (expert setting)
#        # CustomerUserValidFilter => '(!(description=gesperrt))',
#        # Translate manager flag in mapping from its Distinguished Name to cn, sAMAccountName, uid, mail, etc.
#        TranslateManagerTo => 'sAMAccountName',
#        # admin can't change customer preferences
#        AdminSetPreferences => 0,
#        # cache time to live in sec. - cache any ldap queries
#        CacheTTL => 0,
#        Map => [
#            # note: Login, Email and CustomerID needed!
#            # var, frontend, storage, shown (1=always,2=lite), required, storage-type, http-link, readonly, http-link-target, link class(es)
#            [ 'UserTitle',       Translatable('Title or salutation'), 'title',               1, 0, 'var', '', 1, undef, undef ],
#            [ 'UserFirstname',   Translatable('Firstname'),           'givenname',           1, 1, 'var', '', 1, undef, undef ],
#            [ 'UserLastname',    Translatable('Lastname'),            'sn',                  1, 1, 'var', '', 1, undef, undef ],
#            [ 'UserLogin',       Translatable('Username'),            'uid',                 1, 1, 'var', '', 1, undef, undef ],
#            [ 'UserEmail',       Translatable('Email'),               'mail',                1, 1, 'var', '', 1, undef, undef ],
#            [ 'UserCustomerID',  Translatable('CustomerID'),          'mail',                0, 1, 'var', '', 1, undef, undef ],
#            # [ 'UserCustomerIDs', Translatable('CustomerIDs'),         'second_customer_ids', 1, 0, 'var', '', 1, undef, undef ],
#            # [ 'UserManager',       Translatable('Manager'),           'manager',             1, 0, 'var', '', 1, undef, undef ],
#            [ 'UserPhone',       Translatable('Phone'),               'telephonenumber',     1, 0, 'var', '', 1, undef, undef ],
#            [ 'UserAddress',     Translatable('Address'),             'postaladdress',       1, 0, 'var', '', 1, undef, undef ],
#            [ 'UserComment',     Translatable('Comment'),             'description',         1, 0, 'var', '', 1, undef, undef ],
#
#            # this is needed, if "SMIME::FetchFromCustomer" is active
#            # [ 'UserSMIMECertificate', 'SMIMECertificate',             'userSMIMECertificate', 0, 1, 'var', '', 1, undef, undef ],
#
#            # Dynamic field example
#            # [ 'DynamicField_Name_X',   undef,                          'Name_X',              0, 0, 'dynamic_field', undef, 0, undef, undef ],
#        ],
#    };



