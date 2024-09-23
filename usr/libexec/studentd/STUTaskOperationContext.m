@implementation STUTaskOperationContext

- (STUTaskOperationContext)init
{
  STUConfigurationManager *v3;
  STUTaskOperationContext *v4;

  v3 = objc_opt_new(STUConfigurationManager);
  v4 = -[STUTaskOperationContext initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:](self, "initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:", v3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0);

  return v4;
}

- (STUTaskOperationContext)initWithConfigurationManager:(id)a3 sessionInfo:(id)a4 sessionIdentifier:(id)a5 enrollmentRecord:(id)a6 tokenAuthenticator:(id)a7 sessionToken:(id)a8 courseFirstSeenDate:(id)a9 dateProvider:(id)a10 instructorPlatform:(unint64_t)a11 instructorOSVersion:(id)a12 instructorClassroomAppVersion:(id)a13 operationQueue:(id)a14 studentIdentity:(id)a15 IDSMessageBroadcaster:(id)a16 keychain:(id)a17 screenshotServiceProxy:(id)a18 serverResourceCache:(id)a19 featureDataStore:(id)a20 lockScreenMonitor:(id)a21 daemon:(id)a22 device:(id)a23 primitives:(id)a24 classSessionReporter:(id)a25 applicationWorkspace:(id)a26 idleStateProvider:(id)a27 signInHistoryStorage:(id)a28 classKitReSyncer:(id)a29
{
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  STUTaskOperationContext *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  CRKUser *instructor;
  id obj;
  id v50;
  id v51;
  id v52;
  id v54;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;

  v56 = a4;
  obj = a5;
  v72 = a5;
  v50 = a6;
  v54 = a6;
  v51 = a7;
  v71 = a7;
  v52 = a8;
  v70 = a8;
  v69 = a9;
  v68 = a10;
  v67 = a14;
  v66 = a16;
  v65 = a17;
  v64 = a18;
  v63 = a20;
  v62 = a21;
  v61 = a24;
  v60 = a25;
  v59 = a27;
  v58 = a28;
  v57 = a29;
  v33 = a26;
  v34 = a23;
  v35 = a22;
  v36 = a19;
  v37 = a15;
  v38 = a13;
  v39 = a12;
  v40 = a3;
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "crk_endpoint"));
  v42 = -[STUTaskOperationContext initWithConfigurationManager:endpoint:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:studentIdentity:serverResourceCache:daemon:device:applicationWorkspace:](self, "initWithConfigurationManager:endpoint:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:studentIdentity:serverResourceCache:daemon:device:applicationWorkspace:", v40, v41, a11, v39, v38, v37, v36, v35, v34, v33);

  if (v42)
  {
    objc_storeStrong((id *)&v42->_sessionIdentifier, obj);
    objc_storeStrong((id *)&v42->_sessionInfo, a4);
    objc_storeStrong((id *)&v42->_enrollmentRecord, v50);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "instructorsByIdentifier"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "instructorIdentifier"));
    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectForKeyedSubscript:", v44));
    instructor = v42->_instructor;
    v42->_instructor = (CRKUser *)v45;

    objc_storeStrong((id *)&v42->_tokenAuthenticator, v51);
    objc_storeStrong((id *)&v42->_sessionToken, v52);
    objc_storeStrong((id *)&v42->_courseFirstSeenDate, a9);
    objc_storeStrong((id *)&v42->_dateProvider, a10);
    objc_storeStrong((id *)&v42->_operationQueue, a14);
    objc_storeStrong((id *)&v42->_IDSMessageBroadcaster, a16);
    objc_storeStrong((id *)&v42->_keychain, a17);
    objc_storeStrong((id *)&v42->_screenshotServiceProxy, a18);
    objc_storeStrong((id *)&v42->_featureDataStore, a20);
    objc_storeStrong((id *)&v42->_lockScreenMonitor, a21);
    objc_storeStrong((id *)&v42->_primitives, a24);
    objc_storeStrong((id *)&v42->_classSessionReporter, a25);
    objc_storeStrong((id *)&v42->_idleStateProvider, a27);
    objc_storeStrong((id *)&v42->_signInHistoryStorage, a28);
    objc_storeStrong((id *)&v42->_classKitReSyncer, a29);
  }

  return v42;
}

- (STUTaskOperationContext)initWithConfigurationManager:(id)a3 endpoint:(id)a4 instructorPlatform:(unint64_t)a5 instructorOSVersion:(id)a6 instructorClassroomAppVersion:(id)a7 studentIdentity:(id)a8 serverResourceCache:(id)a9 daemon:(id)a10 device:(id)a11 applicationWorkspace:(id)a12
{
  id v18;
  STUTaskOperationContext *v19;
  STUTaskOperationContext *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  objc_super v31;

  v30 = a3;
  v29 = a4;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v18 = a12;
  v31.receiver = self;
  v31.super_class = (Class)STUTaskOperationContext;
  v19 = -[STUTaskOperationContext init](&v31, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_configurationManager, a3);
    objc_storeStrong((id *)&v20->_endpoint, a4);
    v20->_instructorPlatform = a5;
    objc_storeStrong((id *)&v20->_instructorOSVersion, a6);
    objc_storeStrong((id *)&v20->_instructorClassroomAppVersion, a7);
    objc_storeStrong((id *)&v20->_studentIdentity, a8);
    objc_storeStrong((id *)&v20->_serverResourceCache, a9);
    objc_storeStrong((id *)&v20->_daemon, a10);
    objc_storeStrong((id *)&v20->_device, a11);
    objc_storeStrong((id *)&v20->_applicationWorkspace, a12);
  }

  return v20;
}

- (NSArray)allRunningOperations
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperationContext operationQueue](self, "operationQueue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "operations"));

  return (NSArray *)v3;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperationContext sessionIdentifier](self, "sessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperationContext enrollmentRecord](self, "enrollmentRecord"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperationContext tokenAuthenticator](self, "tokenAuthenticator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { sessionIdentifier = %@, enrollmentRecord = %@, tokenAuthenticator = %@ }>"), v3, self, v4, v5, v6));

  return v7;
}

- (BOOL)supportsConnectedInstructor
{
  return 1;
}

- (STUPrimitives)primitives
{
  return self->_primitives;
}

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (STUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (CRKRemoteEndpoint)endpoint
{
  return self->_endpoint;
}

- (DMFControlSessionIdentifier)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (CRKUser)instructor
{
  return self->_instructor;
}

- (STUControlGroupEnrollmentRecord)enrollmentRecord
{
  return self->_enrollmentRecord;
}

- (STUTokenAuthenticationProtocol)tokenAuthenticator
{
  return self->_tokenAuthenticator;
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (NSDate)courseFirstSeenDate
{
  return self->_courseFirstSeenDate;
}

- (STUDateProviderProtocol)dateProvider
{
  return self->_dateProvider;
}

- (unint64_t)instructorPlatform
{
  return self->_instructorPlatform;
}

- (NSString)instructorOSVersion
{
  return self->_instructorOSVersion;
}

- (NSString)instructorClassroomAppVersion
{
  return self->_instructorClassroomAppVersion;
}

- (CRKIdentity)studentIdentity
{
  return self->_studentIdentity;
}

- (CRKIDSMessageBroadcasting)IDSMessageBroadcaster
{
  return self->_IDSMessageBroadcaster;
}

- (CRKKeychain)keychain
{
  return self->_keychain;
}

- (CRKScreenshotServiceInterface)screenshotServiceProxy
{
  return self->_screenshotServiceProxy;
}

- (STUServerResourceCache)serverResourceCache
{
  return self->_serverResourceCache;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (CRKClassroomLockScreenMonitoring)lockScreenMonitor
{
  return self->_lockScreenMonitor;
}

- (STUDevice)device
{
  return self->_device;
}

- (STUClassSessionReporting)classSessionReporter
{
  return self->_classSessionReporter;
}

- (STUApplicationWorkspace)applicationWorkspace
{
  return self->_applicationWorkspace;
}

- (STUIdleStateProviding)idleStateProvider
{
  return self->_idleStateProvider;
}

- (STUSignInHistoryStorage)signInHistoryStorage
{
  return self->_signInHistoryStorage;
}

- (STUClassKitReSyncer)classKitReSyncer
{
  return self->_classKitReSyncer;
}

- (STUDaemon)daemon
{
  return self->_daemon;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_classKitReSyncer, 0);
  objc_storeStrong((id *)&self->_signInHistoryStorage, 0);
  objc_storeStrong((id *)&self->_idleStateProvider, 0);
  objc_storeStrong((id *)&self->_applicationWorkspace, 0);
  objc_storeStrong((id *)&self->_classSessionReporter, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_lockScreenMonitor, 0);
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_serverResourceCache, 0);
  objc_storeStrong((id *)&self->_screenshotServiceProxy, 0);
  objc_storeStrong((id *)&self->_keychain, 0);
  objc_storeStrong((id *)&self->_IDSMessageBroadcaster, 0);
  objc_storeStrong((id *)&self->_studentIdentity, 0);
  objc_storeStrong((id *)&self->_instructorClassroomAppVersion, 0);
  objc_storeStrong((id *)&self->_instructorOSVersion, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_courseFirstSeenDate, 0);
  objc_storeStrong((id *)&self->_sessionToken, 0);
  objc_storeStrong((id *)&self->_tokenAuthenticator, 0);
  objc_storeStrong((id *)&self->_enrollmentRecord, 0);
  objc_storeStrong((id *)&self->_instructor, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_primitives, 0);
}

@end
