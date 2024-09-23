@implementation WebCustomNSURLError

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  void *v6;
  CFTypeRef v7;
  _QWORD v8[4];
  CFTypeRef cf;

  v5 = (void *)-[WebCustomNSURLError userInfo](self, "userInfo");
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSErrorPeerCertificateChainKey"));
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("NSErrorClientCertificateChainKey"));
  objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0CB32F8]);
  objc_msgSend(v6, "removeObjectForKey:", *MEMORY[0x1E0CB3388]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3321888768;
  v8[2] = ___ZL21dictionaryThatCanCodeP12NSDictionary_block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c36_ZTSN3WTF9RetainPtrIP11objc_objectEE_e15_v32__0_8_16_B24l;
  cf = v6;
  if (v6)
    CFRetain(v6);
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v7 = (id)CFMakeCollectable(v6);
  if (cf)
    CFRelease(cf);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", -[WebCustomNSURLError domain](self, "domain"), -[WebCustomNSURLError code](self, "code"), v7), "encodeWithCoder:", a3);
}

@end
