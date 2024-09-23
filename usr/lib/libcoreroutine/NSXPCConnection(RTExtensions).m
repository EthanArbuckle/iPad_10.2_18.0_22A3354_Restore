@implementation NSXPCConnection(RTExtensions)

- (void)rejectInvocation:()RTExtensions withError:replyTypes:
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v16 = v8;
  v9 = a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: invocation";
LABEL_11:
    _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, v14, (uint8_t *)&v15, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    LOWORD(v15) = 0;
    v14 = "Invalid parameter not satisfying: error";
    goto LABEL_11;
  }
  v15 = 0;
  objc_msgSend(v7, "getArgument:atIndex:", &v15, objc_msgSend(v7, "blockArgumentIndex"));
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[NSObject argumentIndexForClass:](v10, "argumentIndexForClass:", objc_opt_class());
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = v12;
    objc_msgSend(v11, "retainArguments");
    objc_msgSend(v11, "setArgument:atIndex:", &v16, v13);
  }
  objc_msgSend(v11, "setTarget:", v15);
  objc_msgSend(v11, "invoke");

LABEL_9:
}

@end
