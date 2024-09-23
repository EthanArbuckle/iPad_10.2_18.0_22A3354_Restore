@implementation RDDiskSpaceUtils

+ (void)requestFreeSpace:(unint64_t)a3 atPath:(id)a4 effortLevel:(unint64_t)a5 queue:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  _UNKNOWN **v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  _UNKNOWN **v25;

  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = &off_100804608;
  if (!a5)
    v14 = &off_1008045F0;
  v24 = kCPFreeSpaceEffortLevelKey;
  v25 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000580C4;
  v19[3] = &unk_1007D9878;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v23 = a3;
  v16 = v13;
  v17 = v12;
  v18 = v11;
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock(a3, v18, v15, v19);

}

@end
