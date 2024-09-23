@implementation NFProductGetName

void __NFProductGetName_block_invoke()
{
  CFTypeID TypeID;

  qword_1ECFF6998 = MGCopyAnswer();
  if (qword_1ECFF6998)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID((CFTypeRef)qword_1ECFF6998))
      return;
    CFRelease((CFTypeRef)qword_1ECFF6998);
  }
  qword_1ECFF6998 = (uint64_t)CFSTR("???");
}

@end
