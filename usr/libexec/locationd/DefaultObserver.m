@implementation DefaultObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", v8));
  if (qword_10230F948 != -1)
    dispatch_once(&qword_10230F948, &stru_1021BF340);
  v11 = qword_10230F940;
  if (os_log_type_enabled((os_log_t)qword_10230F940, OS_LOG_TYPE_INFO))
  {
    v12 = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[CMMslDefaultObserver] Received KVO for key,%{public}@,value,%{public}@", (uint8_t *)&v12, 0x16u);
  }
  sub_1015A2ACC((uint64_t)a6, v8, v10);

}

@end
