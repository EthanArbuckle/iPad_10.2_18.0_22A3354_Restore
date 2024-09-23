@implementation MIBUTempSensorHelper

+ (id)readKey:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __IOHIDEventSystemClient *v10;
  const __CFArray *v11;
  const __CFArray *v12;
  const void *ValueAtIndex;
  uint64_t v14;
  const void *v15;
  void *v16;
  id v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  _QWORD v50[3];
  _QWORD v51[3];

  v5 = *(_QWORD *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c%c%c%c"), HIBYTE(a3), BYTE2(a3), BYTE1(a3), a3));
  v50[0] = CFSTR("PrimaryUsagePage");
  v50[1] = CFSTR("PrimaryUsage");
  v51[0] = &off_10005BBA8;
  v51[1] = &off_10005BBC0;
  v50[2] = CFSTR("LocationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
  v51[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 3));

  v9 = IOHIDEventSystemClientCreate(kCFAllocatorDefault);
  if (!v9)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_1000548F0);
    v19 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A380((uint64_t)v6, v19, v20, v21, v22, v23, v24, v25);
    v49 = 0;
    sub_10000D680(&v49, 2684354566, 0, CFSTR("Failed to read temp key: %@; failed to create HID event system"),
      v22,
      v23,
      v24,
      v25,
      (uint64_t)v6);
    v17 = v49;
LABEL_21:
    v16 = 0;
    if (!a4)
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = (__IOHIDEventSystemClient *)v9;
  IOHIDEventSystemClientSetMatching(v9, v8);
  v11 = IOHIDEventSystemClientCopyServices(v10);
  if (!v11)
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054910);
    v26 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A3E4((uint64_t)v6, v26, v27, v28, v29, v30, v31, v32);
    v48 = 0;
    sub_10000D680(&v48, 2684354566, 0, CFSTR("Failed to read temp key: %@; no matching sensors"),
      v29,
      v30,
      v31,
      v32,
      (uint64_t)v6);
    v17 = v48;
    CFRelease(v10);
    goto LABEL_21;
  }
  v12 = v11;
  if (CFArrayGetCount(v11) == 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v12, 0);
    v14 = IOHIDServiceClientCopyEvent(ValueAtIndex, 15, 0, 0);
    if (v14)
    {
      v15 = (const void *)v14;
      IOHIDEventGetFloatValue(v14, 983040);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
      v17 = 0;
      goto LABEL_6;
    }
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054950);
    v39 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A448((uint64_t)v6, v39, v40, v41, v42, v43, v44, v45);
    v46 = 0;
    sub_10000D680(&v46, 2684354566, 0, CFSTR("Failed to read temp key: %@; failed to copy event"),
      v42,
      v43,
      v44,
      v45,
      (uint64_t)v6);
    v38 = v46;
  }
  else
  {
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100054930);
    v33 = (void *)qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003A4AC((uint64_t)v6, v33, v12);
    v47 = 0;
    CFArrayGetCount(v12);
    sub_10000D680(&v47, 2684354566, 0, CFSTR("Failed to read temp key: %@; %lu matching sensors"),
      v34,
      v35,
      v36,
      v37,
      (uint64_t)v6);
    v38 = v47;
  }
  v17 = v38;
  v15 = 0;
  v16 = 0;
LABEL_6:
  CFRelease(v10);
  CFRelease(v12);
  if (v15)
    CFRelease(v15);
  if (a4)
LABEL_9:
    *a4 = objc_retainAutorelease(v17);
LABEL_10:

  return v16;
}

@end
