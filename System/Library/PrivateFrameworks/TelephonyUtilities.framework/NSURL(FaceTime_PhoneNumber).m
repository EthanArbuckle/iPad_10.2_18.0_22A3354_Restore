@implementation NSURL(FaceTime_PhoneNumber)

+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:forceAssist:suppressAssist:wasAssisted:
{
  return objc_msgSend(a1, "faceTimeURLWithDestinationID:addressBookUID:forceAssist:suppressAssist:wasAssisted:audioOnly:", a3, a4, a5, a6, a7, 0);
}

+ (uint64_t)faceTimeURLWithPhoneNumber:()FaceTime_PhoneNumber addressBookUID:audioOnly:forceAssist:suppressAssist:wasAssisted:
{
  return objc_msgSend(a1, "faceTimeURLWithDestinationID:addressBookUID:forceAssist:suppressAssist:wasAssisted:audioOnly:", a3, a4, a6, a7, a8, a5);
}

@end
