@implementation SSAppWakeRequest

+ (id)familyContentRemovalRequestWithAppIdentifier:(id)a3 accountPairs:(id)a4
{
  id v5;
  void *v6;
  SSAppWakeRequest *v7;
  void *v8;

  v5 = a3;
  +[SSVFamilyContentDeletionEvent notificationPayloadWithAccountPairs:](SSVFamilyContentDeletionEvent, "notificationPayloadWithAccountPairs:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(SSAppWakeRequest);
    -[SSAppWakeRequest setAppIdentifier:](v7, "setAppIdentifier:", v5);
    -[SSAppWakeRequest setShouldLaunchApp:](v7, "setShouldLaunchApp:", 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("UIApplicationLaunchOptionsDeletedFamilyContentKey"), 0);
    -[SSAppWakeRequest setLaunchOptions:](v7, "setLaunchOptions:", v8);
    -[SSAppWakeRequest setProcessAssertionIdentifier:](v7, "setProcessAssertionIdentifier:", CFSTR("com.apple.itunesstored.deletefamilycontent"));
    -[SSAppWakeRequest setProcessAssertionInterval:](v7, "setProcessAssertionInterval:", 10.0);
    -[SSAppWakeRequest setProcessAssertionReason:](v7, "setProcessAssertionReason:", CFSTR("ProcessAssertionReasonTaskCompletion"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)newsstandFinishRequestWithAppIdentifier:(id)a3 issueIdentifiers:(id)a4
{
  id v5;
  id v6;
  SSAppWakeRequest *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SSAppWakeRequest);
  -[SSAppWakeRequest setAppIdentifier:](v7, "setAppIdentifier:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("UIApplicationLaunchOptionsNewsstandDownloadsKey"), 0);
  -[SSAppWakeRequest setLaunchOptions:](v7, "setLaunchOptions:", v8);
  -[SSAppWakeRequest setShouldLaunchApp:](v7, "setShouldLaunchApp:", 1);
  -[SSAppWakeRequest setProcessAssertionIdentifier:](v7, "setProcessAssertionIdentifier:", CFSTR("com.apple.itunesstored.finishdownload"));
  -[SSAppWakeRequest setProcessAssertionInterval:](v7, "setProcessAssertionInterval:", 10.0);
  -[SSAppWakeRequest setProcessAssertionReason:](v7, "setProcessAssertionReason:", CFSTR("ProcessAssertionReasonBackgroundDownload"));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_launchOptions, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSString copyWithZone:](self->_processAssertionIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(double *)(v5 + 32) = self->_processAssertionInterval;
  v12 = -[NSString copyWithZone:](self->_processAssertionReason, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  *(_BYTE *)(v5 + 48) = self->_shouldLaunchApp;
  return (id)v5;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)launchOptions
{
  return self->_launchOptions;
}

- (void)setLaunchOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)processAssertionIdentifier
{
  return self->_processAssertionIdentifier;
}

- (void)setProcessAssertionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)processAssertionInterval
{
  return self->_processAssertionInterval;
}

- (void)setProcessAssertionInterval:(double)a3
{
  self->_processAssertionInterval = a3;
}

- (NSString)processAssertionReason
{
  return self->_processAssertionReason;
}

- (void)setProcessAssertionReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)shouldLaunchApp
{
  return self->_shouldLaunchApp;
}

- (void)setShouldLaunchApp:(BOOL)a3
{
  self->_shouldLaunchApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processAssertionReason, 0);
  objc_storeStrong((id *)&self->_processAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_launchOptions, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
}

@end
