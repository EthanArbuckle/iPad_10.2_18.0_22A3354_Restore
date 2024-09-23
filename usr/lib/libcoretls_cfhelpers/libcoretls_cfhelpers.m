uint64_t mySSLPrivKeyRSA_sign(SecKeyRef key, int a2, UInt8 *bytes, size_t length, uint8_t *sig, size_t *sigLen)
{
  uint64_t v6;
  const __CFString **v10;
  const __CFString *v12;
  const __CFData *v13;
  const __CFData *v14;
  const __CFData *Signature;
  const __CFData *v16;
  size_t v17;
  const UInt8 *BytePtr;

  v6 = 4294957486;
  v10 = (const __CFString **)MEMORY[0x24BDE9330];
  switch(a2)
  {
    case 0:
      return SecKeyRawSign(key, 1u, bytes, length, sig, sigLen);
    case 2:
      goto LABEL_6;
    case 4:
      v10 = (const __CFString **)MEMORY[0x24BDE9338];
      goto LABEL_6;
    case 5:
      v10 = (const __CFString **)MEMORY[0x24BDE9340];
      goto LABEL_6;
    case 6:
      v10 = (const __CFString **)MEMORY[0x24BDE9348];
LABEL_6:
      v12 = *v10;
      v13 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
      if (!v13)
        return 4294957486;
      v14 = v13;
      Signature = SecKeyCreateSignature(key, v12, v13, 0);
      if (Signature)
      {
        v16 = Signature;
        v17 = CFDataGetLength(Signature);
        BytePtr = CFDataGetBytePtr(v16);
        if (BytePtr && v17 >= *sigLen)
        {
          memcpy(sig, BytePtr, v17);
          v6 = 0;
          *sigLen = v17;
        }
        else
        {
          v6 = 4294957486;
        }
        CFRelease(v14);
        CFRelease(v16);
      }
      else
      {
        CFRelease(v14);
        return 4294957486;
      }
      return v6;
    default:
      return v6;
  }
}

uint64_t tls_helper_create_peer_trust(uint64_t a1, char a2, SecTrustRef *a3)
{
  uint64_t **peer_certificates;
  __CFArray *cfarray_from_certificates;
  __CFArray *v7;
  SecTrustRef v8;
  uint64_t v9;
  SecPolicyRef SSL;
  uint64_t v11;
  uint64_t peer_sct_list;
  uint64_t peer_ocsp_response;
  CFDataRef v14;
  uint64_t **v15;
  __CFArray *cfarray_from_buffer_list;
  SecTrustRef trust;

  trust = 0;
  peer_certificates = (uint64_t **)tls_handshake_get_peer_certificates();
  cfarray_from_certificates = tls_helper_create_cfarray_from_certificates(peer_certificates);
  if (cfarray_from_certificates)
  {
    v7 = cfarray_from_certificates;
    if ((a2 & 1) == 0)
      tls_handshake_get_peer_hostname();
    SSL = SecPolicyCreateSSL(a2 ^ 1u, 0);
    if (SSL)
    {
      v11 = SecTrustCreateWithCertificates(v7, SSL, &trust);
      if ((_DWORD)v11)
      {
        v9 = v11;
      }
      else
      {
        if ((a2 & 1) != 0)
          goto LABEL_9;
        peer_sct_list = tls_handshake_get_peer_sct_list();
        peer_ocsp_response = tls_handshake_get_peer_ocsp_response();
        if (!peer_ocsp_response)
          goto LABEL_17;
        v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], *(const UInt8 **)(peer_ocsp_response + 8), *(_QWORD *)peer_ocsp_response);
        v9 = SecTrustSetOCSPResponse(trust, v14);
        if (v14)
          CFRelease(v14);
        if (!(_DWORD)v9)
        {
LABEL_17:
          if (!peer_sct_list)
            goto LABEL_9;
          v15 = (uint64_t **)tls_handshake_get_peer_sct_list();
          cfarray_from_buffer_list = tls_helper_create_cfarray_from_buffer_list(v15);
          v9 = SecTrustSetSignedCertificateTimestamps(trust, cfarray_from_buffer_list);
          if (cfarray_from_buffer_list)
            CFRelease(cfarray_from_buffer_list);
          if (!(_DWORD)v9)
LABEL_9:
            v9 = 0;
        }
      }
    }
    else
    {
      v9 = 4294967188;
    }
    if (SSL)
      CFRelease(SSL);
    CFRelease(v7);
    v8 = trust;
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  *a3 = v8;
  return v9;
}

uint64_t tls_helper_set_identity_from_array(int a1, CFArrayRef theArray)
{
  CFIndex Count;
  uint64_t v4;
  size_t *v5;
  __SecIdentity *ValueAtIndex;
  __SecIdentity *v7;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v10;
  const void *BytePtr;
  size_t Length;
  _QWORD *v13;
  CFIndex i;
  const void *v15;
  CFTypeID v16;
  const void *v17;
  size_t v18;
  const void *context;
  size_t *v20;
  SecKeyRef privateKeyRef;
  SecCertificateRef certificateRef;

  privateKeyRef = 0;
  certificateRef = 0;
  if (!theArray)
  {
    v5 = 0;
    v10 = 4294957488;
LABEL_27:
    free(v5);
    if (privateKeyRef)
      CFRelease(privateKeyRef);
    return v10;
  }
  Count = CFArrayGetCount(theArray);
  if (!Count)
  {
    v5 = 0;
    v10 = 4294957488;
    goto LABEL_24;
  }
  v4 = Count;
  v5 = (size_t *)sslMalloc(24 * Count);
  if (!v5)
  {
    v10 = 4294967188;
    goto LABEL_24;
  }
  ValueAtIndex = (__SecIdentity *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex)
    goto LABEL_23;
  v7 = ValueAtIndex;
  v8 = CFGetTypeID(ValueAtIndex);
  if (v8 != SecIdentityGetTypeID())
    goto LABEL_23;
  v9 = SecIdentityCopyCertificate(v7, &certificateRef);
  if ((_DWORD)v9 || (v9 = SecIdentityCopyPrivateKey(v7, &privateKeyRef), (_DWORD)v9))
  {
    v10 = v9;
    goto LABEL_24;
  }
  BytePtr = (const void *)SecCertificateGetBytePtr();
  Length = SecCertificateGetLength();
  SSLCopyBufferFromData(BytePtr, Length, v5 + 1);
  *v5 = 0;
  if (v4 >= 2)
  {
    v13 = v5 + 3;
    for (i = 1; i != v4; ++i)
    {
      v15 = CFArrayGetValueAtIndex(theArray, i);
      if (!v15)
        goto LABEL_23;
      v16 = CFGetTypeID(v15);
      if (v16 != SecCertificateGetTypeID())
        goto LABEL_23;
      v17 = (const void *)SecCertificateGetBytePtr();
      v18 = SecCertificateGetLength();
      SSLCopyBufferFromData(v17, v18, v13 + 1);
      *v13 = 0;
      *(v13 - 3) = v13;
      v13 += 3;
    }
  }
  SecKeyGetBlockSize(privateKeyRef);
  if (SecKeyGetAlgorithmId() != 1)
  {
    if (SecKeyGetAlgorithmId() != 3)
    {
LABEL_23:
      v10 = 4294967246;
      goto LABEL_24;
    }
    SecECKeyGetNamedCurve();
  }
  if (tls_private_key_create())
    v10 = 0;
  else
    v10 = 4294967188;
LABEL_24:
  if (certificateRef)
    CFRelease(certificateRef);
  if ((_DWORD)v10)
    goto LABEL_27;
  context = (const void *)tls_private_key_get_context();
  CFRetain(context);
  v10 = tls_handshake_set_identity();
  tls_private_key_destroy();
  if (v5)
  {
    v20 = v5;
    do
    {
      SSLFreeBuffer(v20 + 1);
      v20 = (size_t *)*v20;
    }
    while (v20);
  }
  sslFree(v5);
  return v10;
}

uint64_t tls_helper_set_peer_pubkey()
{
  uint64_t **peer_certificates;
  __CFArray *cfarray_from_certificates;
  __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t AlgorithmId;
  uint64_t v7;
  const __CFData *v8;
  const __CFData *v9;
  uint64_t v10;
  const __CFData *v11;
  SecTrustRef trust;

  trust = 0;
  peer_certificates = (uint64_t **)tls_handshake_get_peer_certificates();
  cfarray_from_certificates = tls_helper_create_cfarray_from_certificates(peer_certificates);
  if (!cfarray_from_certificates)
    return 0;
  v2 = cfarray_from_certificates;
  v3 = SecTrustCreateWithCertificates(cfarray_from_certificates, 0, &trust);
  if ((_DWORD)v3)
  {
    v10 = v3;
    goto LABEL_16;
  }
  v4 = MEMORY[0x22E2E6CFC](trust);
  if (!v4)
  {
    v10 = 4294957488;
    goto LABEL_16;
  }
  v5 = (const void *)v4;
  AlgorithmId = SecKeyGetAlgorithmId();
  if (AlgorithmId == 3)
  {
    SecECKeyGetNamedCurve();
    v11 = (const __CFData *)SecECKeyCopyPublicBits();
    if (v11)
    {
      v9 = v11;
      CFDataGetBytePtr(v11);
      CFDataGetLength(v9);
      v10 = tls_handshake_set_peer_ec_public_key();
      CFRelease(v5);
LABEL_15:
      CFRelease(v9);
      goto LABEL_16;
    }
LABEL_14:
    v10 = 4294957487;
    v9 = (const __CFData *)v5;
    goto LABEL_15;
  }
  if (AlgorithmId != 1)
    goto LABEL_14;
  v7 = SecKeyCopyModulus();
  if (!v7)
    goto LABEL_14;
  v8 = (const __CFData *)v7;
  v9 = (const __CFData *)SecKeyCopyExponent();
  if (v9)
  {
    CFDataGetBytePtr(v8);
    CFDataGetLength(v8);
    CFDataGetBytePtr(v9);
    CFDataGetLength(v9);
    v10 = tls_handshake_set_peer_rsa_public_key();
  }
  else
  {
    v10 = 4294957487;
  }
  CFRelease(v5);
  CFRelease(v8);
  if (v9)
    goto LABEL_15;
LABEL_16:
  if (trust)
    CFRelease(trust);
  CFRelease(v2);
  return v10;
}

__CFArray *tls_helper_create_cfarray_from_certificates(uint64_t **a1)
{
  uint64_t **v1;
  const __CFAllocator *v2;
  __CFArray *Mutable;
  const __CFAllocator *v4;
  const __CFData *v5;
  __CFArray *v6;
  SecCertificateRef v7;
  SecCertificateRef v8;

  if (!a1)
    return 0;
  v1 = a1;
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    while (1)
    {
      v5 = CFDataCreateWithBytesNoCopy(v2, (const UInt8 *)v1[2], (CFIndex)v1[1], v4);
      if (!v5)
      {
        v6 = Mutable;
        goto LABEL_10;
      }
      v6 = v5;
      v7 = SecCertificateCreateWithData(v2, v5);
      if (!v7)
        break;
      v8 = v7;
      CFArrayAppendValue(Mutable, v7);
      CFRelease(v8);
      CFRelease(v6);
      v1 = (uint64_t **)*v1;
      if (!v1)
        return Mutable;
    }
    CFRelease(Mutable);
LABEL_10:
    CFRelease(v6);
    return 0;
  }
  return Mutable;
}

void *sslMalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC274D582uLL);
}

void sslFree(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t SSLFreeBuffer(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (void *)a1[1];
  if (v2)
    free(v2);
  result = 0;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

uint64_t SSLCopyBufferFromData(const void *a1, size_t a2, size_t *a3)
{
  void *v5;
  uint64_t result;

  v5 = sslAllocCopy(a1, a2);
  a3[1] = (size_t)v5;
  if (!v5)
    return 0xFFFFFFFFLL;
  result = 0;
  *a3 = a2;
  return result;
}

void *sslAllocCopy(const void *a1, size_t size)
{
  void *v4;
  void *v5;

  v4 = malloc_type_malloc(size, 0xC274D582uLL);
  v5 = v4;
  if (v4)
    memmove(v4, a1, size);
  return v5;
}

void *sslRealloc(void *a1, int a2, size_t size)
{
  return malloc_type_realloc(a1, size, 0x5F1AF22BuLL);
}

uint64_t SSLAllocBuffer(size_t *a1, size_t size)
{
  void *v4;
  size_t v5;
  uint64_t v6;

  v4 = malloc_type_malloc(size, 0xC274D582uLL);
  if (v4)
    v5 = size;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = 0xFFFFFFFFLL;
  *a1 = v5;
  a1[1] = (size_t)v4;
  return v6;
}

uint64_t SSLReallocBuffer(uint64_t a1, size_t a2)
{
  void *v4;
  size_t v5;
  uint64_t v6;

  v4 = malloc_type_realloc(*(void **)(a1 + 8), a2, 0x5F1AF22BuLL);
  if (v4)
    v5 = a2;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = 0xFFFFFFFFLL;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  return v6;
}

uint64_t SSLAllocCopyBuffer(size_t *a1, size_t **a2)
{
  size_t *v4;
  size_t *v5;
  size_t v6;
  size_t *v7;
  void *v8;
  uint64_t result;

  v4 = (size_t *)malloc_type_malloc(0x10uLL, 0xC274D582uLL);
  if (v4)
  {
    v5 = v4;
    v7 = a1;
    v6 = *a1;
    v8 = sslAllocCopy((const void *)v7[1], v6);
    v5[1] = (size_t)v8;
    if (v8)
    {
      result = 0;
      *v5 = v6;
      *a2 = v5;
      return result;
    }
    free(v5);
  }
  return 0xFFFFFFFFLL;
}

uint64_t SSLCopyBuffer(uint64_t a1, size_t *a2)
{
  size_t v3;
  void *v4;
  uint64_t result;

  v3 = *(_QWORD *)a1;
  v4 = sslAllocCopy(*(const void **)(a1 + 8), *(_QWORD *)a1);
  a2[1] = (size_t)v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = v3;
  return result;
}

uint64_t SSLCopyBufferTerm(const void *a1, size_t a2, uint64_t a3)
{
  void *v6;
  size_t v7;
  size_t v8;
  uint64_t result;

  v6 = malloc_type_malloc(a2 + 1, 0xC274D582uLL);
  if (v6)
    v7 = a2 + 1;
  else
    v7 = 0;
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  memmove(v6, a1, a2);
  *(_BYTE *)(*(_QWORD *)(a3 + 8) + a2) = 0;
  v8 = strlen(*(const char **)(a3 + 8));
  result = 0;
  *(_QWORD *)a3 = v8;
  return result;
}

uint64_t tls_free_buffer_list(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      v3 = (void *)v1[2];
      if (v3)
        free(v3);
      free(v1);
      v1 = v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t tls_copy_buffer_list(uint64_t **a1, _QWORD *a2)
{
  uint64_t **v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  size_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t result;

  if (a1)
  {
    v3 = a1;
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = malloc_type_malloc(0x18uLL, 0xC274D582uLL);
      if (!v6)
        break;
      v7 = v6;
      *v6 = 0;
      v8 = (size_t)v3[1];
      v9 = sslAllocCopy(v3[2], v8);
      v7[2] = v9;
      if (!v9)
      {
        free(v7);
        break;
      }
      v7[1] = v8;
      v10 = v7;
      if (v5)
      {
        *v4 = v7;
        v10 = v5;
      }
      v3 = (uint64_t **)*v3;
      v4 = v7;
      v5 = v10;
      if (!v3)
        goto LABEL_10;
    }
    tls_free_buffer_list(v5);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v10 = 0;
LABEL_10:
    result = 0;
    *a2 = v10;
  }
  return result;
}

uint64_t mySSLPrivKeyRSA_decrypt(__SecKey *a1, uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return SecKeyDecrypt(a1, 1u, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t mySSLPrivKeyECDSA_sign(__SecKey *a1, uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return SecKeyRawSign(a1, 1u, dataToSign, dataToSignLen, sig, sigLen);
}

__CFArray *tls_helper_create_cfarray_from_buffer_list(uint64_t **a1)
{
  const __CFAllocator *v2;
  __CFArray *Mutable;
  CFDataRef v4;
  CFDataRef v5;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable && a1)
  {
    while (1)
    {
      v4 = CFDataCreate(v2, (const UInt8 *)a1[2], (CFIndex)a1[1]);
      if (!v4)
        break;
      v5 = v4;
      CFArrayAppendValue(Mutable, v4);
      CFRelease(v5);
      a1 = (uint64_t **)*a1;
      if (!a1)
        return Mutable;
    }
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t tls_helper_version_from_SSLProtocol(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 2;
  result = 768;
  switch(v1)
  {
    case 0:
      return result;
    case 2:
      result = 769;
      break;
    case 5:
      result = 770;
      break;
    case 6:
      result = 771;
      break;
    case 7:
      result = 65279;
      break;
    case 8:
      result = 772;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t tls_helper_SSLProtocol_from_version(int a1)
{
  int v1;
  uint64_t result;

  v1 = a1 - 768;
  result = 2;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 4;
      break;
    case 2:
      result = 7;
      break;
    case 3:
      result = 8;
      break;
    case 4:
      result = 10;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__CFArray *tls_helper_create_peer_acceptable_dn_array()
{
  uint64_t **peer_acceptable_dn_list;

  peer_acceptable_dn_list = (uint64_t **)tls_handshake_get_peer_acceptable_dn_list();
  return tls_helper_create_cfarray_from_buffer_list(peer_acceptable_dn_list);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

uint64_t SecCertificateGetBytePtr()
{
  return MEMORY[0x24BDE8928]();
}

uint64_t SecCertificateGetLength()
{
  return MEMORY[0x24BDE8930]();
}

CFTypeID SecCertificateGetTypeID(void)
{
  return MEMORY[0x24BDE8948]();
}

uint64_t SecECKeyCopyPublicBits()
{
  return MEMORY[0x24BDE8A30]();
}

uint64_t SecECKeyGetNamedCurve()
{
  return MEMORY[0x24BDE8A38]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x24BDE8A50](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x24BDE8A60]();
}

uint64_t SecKeyCopyExponent()
{
  return MEMORY[0x24BDE8AA0]();
}

uint64_t SecKeyCopyModulus()
{
  return MEMORY[0x24BDE8AB8]();
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B38](key, algorithm, dataToSign, error);
}

OSStatus SecKeyDecrypt(SecKeyRef key, SecPadding padding, const uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return MEMORY[0x24BDE8B48](key, *(_QWORD *)&padding, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x24BDE8B68]();
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x24BDE8B70](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x24BDE8B90](key, *(_QWORD *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x24BDE8C78](server, hostname);
}

SecKeyRef SecTrustCopyPublicKey(SecTrustRef trust)
{
  return (SecKeyRef)MEMORY[0x24BDE8DC8](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x24BDE8DD8](certificates, policies, trust);
}

OSStatus SecTrustSetOCSPResponse(SecTrustRef trust, CFTypeRef responseData)
{
  return MEMORY[0x24BDE8E48](trust, responseData);
}

OSStatus SecTrustSetSignedCertificateTimestamps(SecTrustRef trust, CFArrayRef sctArray)
{
  return MEMORY[0x24BDE8E58](trust, sctArray);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t tls_handshake_get_peer_acceptable_dn_list()
{
  return MEMORY[0x24BEDB9B8]();
}

uint64_t tls_handshake_get_peer_certificates()
{
  return MEMORY[0x24BEDB9C0]();
}

uint64_t tls_handshake_get_peer_hostname()
{
  return MEMORY[0x24BEDB9C8]();
}

uint64_t tls_handshake_get_peer_ocsp_response()
{
  return MEMORY[0x24BEDB9D0]();
}

uint64_t tls_handshake_get_peer_sct_list()
{
  return MEMORY[0x24BEDB9D8]();
}

uint64_t tls_handshake_set_identity()
{
  return MEMORY[0x24BEDB9E0]();
}

uint64_t tls_handshake_set_peer_ec_public_key()
{
  return MEMORY[0x24BEDB9E8]();
}

uint64_t tls_handshake_set_peer_rsa_public_key()
{
  return MEMORY[0x24BEDB9F0]();
}

uint64_t tls_private_key_create()
{
  return MEMORY[0x24BEDB9F8]();
}

uint64_t tls_private_key_destroy()
{
  return MEMORY[0x24BEDBA00]();
}

