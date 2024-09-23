@implementation HUDConfiguration

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016FD4;
  block[3] = &unk_10004D420;
  block[4] = a1;
  if (qword_100060248 != -1)
    dispatch_once(&qword_100060248, block);
  return (id)qword_100060240;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HUDConfiguration)init
{
  NSArray *thirdPartyDevPreferredLanguages;

  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_runloopHangTimeoutDurationMSec = 9000;
  self->_thirdPartyDevPreferredLanguages = 0;

  self->_areProcessTerminationsMonitored = 0;
  return self;
}

- (HUDConfiguration)initWithRunloopHangTimeoutDurationMSec:(unint64_t)a3 thirdPartyDevPreferredLanguages:(id)a4 areProcessTerminationsMonitored:(BOOL)a5 processTerminationsFiltering:(id)a6
{
  id v11;
  id v12;
  HUDConfiguration *v13;
  HUDConfiguration *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HUDConfiguration;
  v13 = -[HUDConfiguration init](&v16, "init");
  v14 = v13;
  if (v13)
  {
    v13->_runloopHangTimeoutDurationMSec = a3;
    objc_storeStrong((id *)&v13->_thirdPartyDevPreferredLanguages, a4);
    v14->_areProcessTerminationsMonitored = a5;
    objc_storeStrong((id *)&v14->_processTerminationsFiltering, a6);
  }

  return v14;
}

- (void)updateWithHUDConfiguration:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *thirdPartyDevPreferredLanguages;
  HTProcessExitFilteringConfiguration *v7;
  HTProcessExitFilteringConfiguration *processTerminationsFiltering;

  v4 = a3;
  self->_runloopHangTimeoutDurationMSec = (unint64_t)objc_msgSend(v4, "runloopHangTimeoutDurationMSec");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "thirdPartyDevPreferredLanguages"));
  thirdPartyDevPreferredLanguages = self->_thirdPartyDevPreferredLanguages;
  self->_thirdPartyDevPreferredLanguages = v5;

  self->_areProcessTerminationsMonitored = objc_msgSend(v4, "areProcessTerminationsMonitored");
  v7 = (HTProcessExitFilteringConfiguration *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "processTerminationsFiltering"));

  processTerminationsFiltering = self->_processTerminationsFiltering;
  self->_processTerminationsFiltering = v7;

}

- (HUDConfiguration)initWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  HUDConfiguration *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("runloopHangTimeoutDurationMSec"));
  v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("thirdPartyDevPreferredLanguages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("areProcessTerminationsMonitored"));
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(HTProcessExitFilteringConfiguration), CFSTR("processTerminationsFiltering"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = -[HUDConfiguration initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:](self, "initWithRunloopHangTimeoutDurationMSec:thirdPartyDevPreferredLanguages:areProcessTerminationsMonitored:processTerminationsFiltering:", v5, v7, v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t runloopHangTimeoutDurationMSec;
  id v5;

  runloopHangTimeoutDurationMSec = self->_runloopHangTimeoutDurationMSec;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", runloopHangTimeoutDurationMSec, CFSTR("runloopHangTimeoutDurationMSec"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_thirdPartyDevPreferredLanguages, CFSTR("thirdPartyDevPreferredLanguages"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_areProcessTerminationsMonitored, CFSTR("areProcessTerminationsMonitored"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processTerminationsFiltering, CFSTR("processTerminationsFiltering"));

}

- (unint64_t)runloopHangTimeoutDurationMSec
{
  return self->_runloopHangTimeoutDurationMSec;
}

- (NSArray)thirdPartyDevPreferredLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)areProcessTerminationsMonitored
{
  return self->_areProcessTerminationsMonitored;
}

- (HTProcessExitFilteringConfiguration)processTerminationsFiltering
{
  return (HTProcessExitFilteringConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processTerminationsFiltering, 0);
  objc_storeStrong((id *)&self->_thirdPartyDevPreferredLanguages, 0);
}

@end
