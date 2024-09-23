@implementation NSError(SHCoreError)

- (uint64_t)sh_isShazamCoreError
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "domain");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ShazamCore"));

  return v2;
}

- (uint64_t)sh_isCoreJSONLFileParsingError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 300;
  return result;
}

- (uint64_t)sh_isCoreCompressionError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 301;
  return result;
}

- (uint64_t)sh_isCoreDecompressionError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 302;
  return result;
}

- (uint64_t)sh_isCoreDaemonExit
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 100;
  return result;
}

- (uint64_t)sh_isCoreMatchAttemptRejectedError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 101;
  return result;
}

- (uint64_t)sh_isCoreMissingEntitlementsError
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 102;
  return result;
}

- (uint64_t)sh_isCoreMediaItemMissingRequiredProperties
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 400;
  return result;
}

- (uint64_t)sh_isCoreServerResponseMissingRequiredProperties
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 401;
  return result;
}

- (uint64_t)sh_isCoreFailedToStartAudioRecording
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 104;
  return result;
}

- (uint64_t)sh_isCoreToldNotToResumeAudioRecordingAfterInterruption
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 105;
  return result;
}

- (uint64_t)sh_isCoreServerResponseWorkerAlreadyRegistered
{
  uint64_t result;

  result = objc_msgSend(a1, "sh_isShazamCoreError");
  if ((_DWORD)result)
    return objc_msgSend(a1, "code") == 106;
  return result;
}

@end
