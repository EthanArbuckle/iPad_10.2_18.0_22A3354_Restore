@implementation CSInjectionService

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;
  id v6;

  v6 = a3;
  v5 = a4 + 1;
  if (v5 < (unint64_t)objc_msgSend(v6, "count"))
    objc_msgSend(objc_msgSend(v6, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", v6, v5);

}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_100389288 != -1)
    dispatch_once(&qword_100389288, &stru_100345128);
  return (id)qword_100389280;
}

- (CSInjectionService)init
{
  CSInjectionService *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSInjectionService;
  result = -[CSInjectionService initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CSInjectionServiceProtocol, &OBJC_PROTOCOL___CSInjectionServiceClientProtocol);
  if (result)
    result->_mapMissBehavior = 0;
  return result;
}

- (void)beginService
{
  NSMutableDictionary *v3;
  NSMutableDictionary *classInjectionMap;

  v3 = (NSMutableDictionary *)objc_opt_new(NSMutableDictionary, a2);
  classInjectionMap = self->_classInjectionMap;
  self->_classInjectionMap = v3;

}

- (void)amendClassReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSInjectionService classInjectionMap](self, "classInjectionMap"));
  objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  -[CSInjectionService setMapMissBehavior:](self, "setMapMissBehavior:", v4);
}

- (void)setClassReplacementMap:(id)a3 missBehavior:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSInjectionService classInjectionMap](self, "classInjectionMap"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSInjectionService classInjectionMap](self, "classInjectionMap"));
  objc_msgSend(v7, "addEntriesFromDictionary:", v8);

  -[CSInjectionService setMapMissBehavior:](self, "setMapMissBehavior:", v4);
}

- (id)syncgetClassForName:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *v6;
  Class v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  Class v11;
  id result;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;

  v4 = (NSString *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSInjectionService classInjectionMap](self, "classInjectionMap"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (v6)
  {
    v7 = NSClassFromString(v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
LABEL_7:
    v10 = (void *)v8;
    goto LABEL_8;
  }
  v9 = -[CSInjectionService mapMissBehavior](self, "mapMissBehavior");
  if (!v9)
  {
    v11 = NSClassFromString(v4);
    v8 = objc_claimAutoreleasedReturnValue(v11);
    goto LABEL_7;
  }
  if (v9 != 2)
  {
    v10 = 0;
LABEL_8:

    return v10;
  }
  v13 = sub_100007798();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 68289795;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = v4;
    v25 = 2082;
    v26 = "assert";
    v27 = 2081;
    v28 = "realClass";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  v15 = sub_100007798();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 68289795;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = v4;
    v25 = 2082;
    v26 = "assert";
    v27 = 2081;
    v28 = "realClass";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Unable to find classForName", "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  v17 = sub_100007798();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289795;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2114;
    v24 = v4;
    v25 = 2082;
    v26 = "assert";
    v27 = 2081;
    v28 = "realClass";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Unable to find classForName\", \"name\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
  }

  result = (id)abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyCore/CSInjectionService.mm", 61, "-[CSInjectionService syncgetClassForName:]");
  __break(1u);
  return result;
}

- (NSMutableDictionary)classInjectionMap
{
  return self->_classInjectionMap;
}

- (int)mapMissBehavior
{
  return self->_mapMissBehavior;
}

- (void)setMapMissBehavior:(int)a3
{
  self->_mapMissBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classInjectionMap, 0);
}

@end
