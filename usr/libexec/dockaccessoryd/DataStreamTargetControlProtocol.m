@implementation DataStreamTargetControlProtocol

+ (void)sendTargetControlWhoAmIWithIdentifier:(unsigned int)a3 dataStreamProtocolDelegate:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v8 = CFSTR("identifier");
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  objc_msgSend(v5, "sendEventForProtocol:topic:payload:completion:", CFSTR("targetControl"), CFSTR("whoami"), v7, &stru_100236EC8);
}

@end
