@implementation NSData(BRCSignatureAdditions)

+ (id)brc_pendingPlaceholderForPackage:()BRCSignatureAdditions
{
  uint64_t *v4;

  if (brc_pendingPlaceholder_once != -1)
    dispatch_once(&brc_pendingPlaceholder_once, &__block_literal_global_11);
  v4 = &brc_pendingPlaceholder_pkgPlaceHolder;
  if (!a3)
    v4 = &brc_pendingPlaceholder_filePlaceHolder;
  return (id)*v4;
}

- (BOOL)brc_signatureIsPendingPlaceHolder
{
  unsigned __int8 *v2;
  int v3;

  if (objc_msgSend(a1, "length") != 2)
    return 0;
  v2 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v2[1] != 63)
    return 0;
  v3 = *v2;
  return v3 == 1 || v3 == 27;
}

- (unsigned)brc_signatureIsPackage
{
  unsigned __int8 *result;

  result = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (result)
    return (unsigned __int8 *)(*result == 27);
  return result;
}

- (uint64_t)brc_signatureIsValid
{
  void *v3;
  NSObject *v4;

  if ((objc_msgSend(a1, "brc_signatureIsPendingPlaceHolder") & 1) == 0)
  {
    if ((objc_msgSend(a1, "brc_signatureIsPackage") & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDB9248], "isValidSignature:", a1) & 1) != 0)
    {
      return 1;
    }
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
      -[NSData(BRCSignatureAdditions) brc_signatureIsValid].cold.1((uint64_t)a1, (uint64_t)v3, v4);

  }
  return 0;
}

- (id)brc_signature
{
  id v2;
  id v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x24BDB9248]);
  v3 = objc_retainAutorelease(a1);
  objc_msgSend(v2, "updateWithBytes:length:", objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"));
  objc_msgSend(v2, "dataByFinishingSignature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)brc_signatureIsValid
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_230455000, log, (os_log_type_t)0x90u, "[ERROR] invalid signature in %@%@", (uint8_t *)&v3, 0x16u);
}

@end
