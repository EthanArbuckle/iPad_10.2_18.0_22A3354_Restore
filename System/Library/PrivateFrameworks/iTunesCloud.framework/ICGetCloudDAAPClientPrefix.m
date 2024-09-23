@implementation ICGetCloudDAAPClientPrefix

void __ICGetCloudDAAPClientPrefix_block_invoke()
{
  __CFString *v0;
  id v1;

  +[ICDeviceInfo currentDeviceInfo](ICDeviceInfo, "currentDeviceInfo");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isAppleTV"))
    v0 = CFSTR("ATV-");
  else
    v0 = CFSTR("iOS-");
  objc_storeStrong((id *)&ICGetCloudDAAPClientPrefix_cloudDAAPClientPrefix, v0);

}

@end
