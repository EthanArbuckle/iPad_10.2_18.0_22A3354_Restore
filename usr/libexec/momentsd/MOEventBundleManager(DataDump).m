@implementation MOEventBundleManager(DataDump)

- (void)buildLabelsForEventBundles:()DataDump .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "metaData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "build labels, meta data, %@", a1, 0xCu);

}

@end
