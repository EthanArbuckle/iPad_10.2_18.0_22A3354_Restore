@implementation GKProfileServiceInterface(NillableShim)

+ (uint64_t)getProfilesForPlayerIDs:()NillableShim fetchOptions:from:handler:
{
  return objc_msgSend(a5, "getProfilesForPlayerIDs:fetchOptions:handler:", a3, a4, a6);
}

@end
