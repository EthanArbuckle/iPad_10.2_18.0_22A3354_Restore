@implementation BKHIDHapticFeedbackInterface

- (void)playHapticFeedbackRequest:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  NSObject *v13;
  unsigned __int8 v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pattern"));
  v5 = objc_msgSend(v3, "timestamp");
  v6 = objc_msgSend(v3, "senderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "powerSourceID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AHFManager sharedInstance](AHFManager, "sharedInstance"));
  v9 = v8;
  if (v7)
  {
    v16 = 0;
    v10 = objc_msgSend(v8, "playFeedback:powerSourceID:timestamp:error:", v4, v7, v5, &v16);
    v11 = v16;

    if (v10)
      goto LABEL_3;
  }
  else
  {
    v17 = 0;
    v14 = objc_msgSend(v8, "playFeedback:senderID:timestamp:error:", v4, v6, v5, &v17);
    v11 = v17;

    if ((v14 & 1) != 0)
    {
LABEL_3:
      v12 = sub_100059AFC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v19 = v3;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Haptic feedback request %{public}@ successful", buf, 0xCu);
      }
      goto LABEL_8;
    }
  }
  v15 = sub_100059AFC();
  v13 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v3;
    v20 = 2114;
    v21 = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Haptic feedback request %{public}@ failed with error %{public}@", buf, 0x16u);
  }
LABEL_8:

}

@end
