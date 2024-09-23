@implementation NSURL(FaceTime_ShowAddParticipant)

- (uint64_t)isShowAddParticipantURL
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "isFaceTimeMultiwayURL");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "tuQueryParameters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("show-add-participant"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("1"));

    return v5;
  }
  return result;
}

- (id)conversationGroupUUID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tuQueryParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("conversationUUID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
