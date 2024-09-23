@implementation ACMDelegate

- (ACMDelegate)init
{
  ACMDelegate *v2;
  ACMDelegate *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ACMDelegate;
  v2 = -[ACMDelegate init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ACMDelegate setCopyTicketCompletion:](v2, "setCopyTicketCompletion:", 0);
  return v3;
}

- (id)appleConnectParentViewController:(id)a3
{
  NSLog(CFSTR("appleConnectParentViewController returning nil"), a2, a3);
  return 0;
}

- (void)appleConnect:(id)a3 authenticationDidEndWithResponse:(id)a4
{
  __CFData *v6;
  const __CFAllocator *v7;
  __CFData *Mutable;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  CFIndex Length;
  const __CFString *v13;
  CFIndex v14;
  char *MutableBytePtr;
  CFIndex v16;
  CFIndex v17;
  char *v18;
  CFIndex v19;
  const UInt8 *BytePtr;
  CFIndex v21;
  CFIndex v22;
  void (**v23)(id, __CFData *, uint64_t);

  if (objc_msgSend(a4, "error", a3))
  {
    NSLog(CFSTR("authenticationDidEndWithResponse nil != aResponse.error %@"), objc_msgSend(a4, "error"));
    v6 = 0;
  }
  else
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    v9 = objc_msgSend(a4, "userName");
    v10 = (const __CFString *)objc_msgSend(a4, "token");
    v6 = CFDataCreateMutable(v7, 0);
    v11 = objc_msgSend(a4, "userName");
    Length = CFStringGetLength((CFStringRef)objc_msgSend(a4, "token"));
    NSLog(CFSTR("authenticationDidEndWithResponse Success!\nuserName=%@\ntoken(%ld)=%@"), v11, Length, objc_msgSend(a4, "token"));
    v13 = CFStringCreateWithFormat(v7, 0, CFSTR("%@/%d"), v9, 1205);
    v14 = CFStringGetLength(v13);
    CFDataSetLength(v6, v14 + 1);
    MutableBytePtr = (char *)CFDataGetMutableBytePtr(v6);
    v16 = CFDataGetLength(v6);
    CFStringGetCString(v13, MutableBytePtr, v16, 0x8000100u);
    v17 = CFStringGetLength(v10);
    CFDataSetLength(Mutable, v17 + 1);
    v18 = (char *)CFDataGetMutableBytePtr(Mutable);
    v19 = CFDataGetLength(Mutable);
    CFStringGetCString(v10, v18, v19, 0x8000100u);
    BytePtr = CFDataGetBytePtr(Mutable);
    v21 = CFDataGetLength(Mutable);
    CFDataAppendBytes(v6, BytePtr, v21 - 1);
    v22 = CFDataGetLength(v6);
    NSLog(CFSTR("ssoData(%ld)=%@"), v22, v6);
    CFRelease(v13);
    CFRelease(Mutable);
  }
  v23 = -[ACMDelegate copyTicketCompletion](self, "copyTicketCompletion");
  v23[2](v23, v6, objc_msgSend(a4, "error"));
  if (v6)
    CFRelease(v6);
}

- (id)copyTicketCompletion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCopyTicketCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (unsigned)finished
{
  return self->_finished;
}

- (void)setFinished:(unsigned __int8)a3
{
  self->_finished = a3;
}

@end
