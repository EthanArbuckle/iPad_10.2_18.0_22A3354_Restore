@implementation TrustEvaluator

+ (BOOL)validatePublicKey:(id)a3 trustRefs:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __SecTrust *v12;
  __SecKey *v13;
  __SecKey *v14;
  const __CFData *v15;
  CFErrorRef v16;
  BOOL v17;
  const void *PublicWithData;
  __CFData *v19;
  char v20;
  CFErrorRef error;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(__SecTrust **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (v12)
          {
            v13 = SecTrustCopyKey(v12);
            if (v13)
            {
              v14 = v13;
              error = 0;
              v15 = SecKeyCopyExternalRepresentation(v13, &error);
              CFRelease(v14);
              v16 = error;
              if (v15)
                v17 = error == 0;
              else
                v17 = 0;
              if (v17)
              {
                PublicWithData = (const void *)PCSKeyCreatePublicWithData(v15, 0);
                CFRelease(v15);
                if (PublicWithData)
                {
                  v19 = _PCSKeyCopyExportedPublicKey((uint64_t)PublicWithData);
                  CFRelease(PublicWithData);
                  v20 = objc_msgSend(v5, "isEqual:", v19);

                  if ((v20 & 1) != 0)
                  {
                    LOBYTE(v9) = 1;
                    goto LABEL_25;
                  }
                }
              }
              else
              {
                if (v15)
                {
                  CFRelease(v15);
                  v16 = error;
                }
                if (v16)
                {
                  NSLog(CFSTR("Error when copying external representation of server signature public key. %@"), v16);
                  CFRelease(error);
                }
              }
            }
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_25:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

@end
