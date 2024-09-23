@implementation TRIPushNotification

+ (id)descriptor
{
  id v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = (id)descriptor_descriptor_8;
  if (!descriptor_descriptor_8)
  {
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    LODWORD(v8) = 0;
    v2 = +[TRIPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TRIPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", v5, v6, TRITripushNotificationRoot_FileDescriptor(), off_1ECF0E2F8, 2, 24, v8);
    objc_msgSend(v2, "setupOneofs:count:firstHasIndex:", _MergedGlobals_1, 1, 0xFFFFFFFFLL);
    if (descriptor_descriptor_8)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TripushNotification.pbobjc.m"), 102, CFSTR("Startup recursed!"));
    descriptor_descriptor_8 = (uint64_t)v2;
  }
  return v2;
}

@end
