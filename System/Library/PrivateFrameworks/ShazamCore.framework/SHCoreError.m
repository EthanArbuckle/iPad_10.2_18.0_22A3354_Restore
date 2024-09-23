@implementation SHCoreError

+ (BOOL)annotateError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6
{
  void *v8;

  +[SHCoreError errorWithCode:underlyingError:keyOverrides:](SHCoreError, "errorWithCode:underlyingError:keyOverrides:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(a1, "annotateError:withError:", a3, v8);

  return (char)a3;
}

+ (BOOL)annotateError:(id *)a3 withError:(id)a4
{
  if (a3)
    *a3 = objc_retainAutorelease(a4);
  return a3 != 0;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)objc_msgSend(a1, "errorWithCode:underlyingError:keyOverrides:", a3, a4, MEMORY[0x24BDBD1B8]);
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, *MEMORY[0x24BDD1398]);

  objc_msgSend(a1, "messageForCode:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v12, *MEMORY[0x24BDD0BA0]);

  objc_msgSend(v11, "setValuesForKeysWithDictionary:", v9);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.ShazamCore"), a3, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)messageForCode:(int64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;

  result = CFSTR("A compression error occurred.");
  if (a3 > 299)
  {
    v4 = CFSTR("The media item is missing one or more required properties");
    v5 = CFSTR("The response is missing required properties");
    if (a3 != 401)
      v5 = CFSTR("A compression error occurred.");
    if (a3 != 400)
      v4 = v5;
    v6 = CFSTR("There was an error reading the supplied file.");
    v7 = CFSTR("A decompression error occurred.");
    if (a3 != 302)
      v7 = CFSTR("A compression error occurred.");
    if (a3 != 300)
      v6 = v7;
    if (a3 <= 399)
      return (id)v6;
    else
      return (id)v4;
  }
  else
  {
    switch(a3)
    {
      case 'd':
        result = CFSTR("The Daemon exited");
        break;
      case 'e':
        result = CFSTR("The match attempt was rejected");
        break;
      case 'f':
        result = CFSTR("Missing entitlements");
        break;
      case 'h':
        result = CFSTR("One or more audio recorders were unable to start");
        break;
      case 'i':
        result = CFSTR("Told not to resume audio recording after an interruption");
        break;
      case 'j':
        result = CFSTR("An attempt was made to register the same worker twice");
        break;
      default:
        return result;
    }
  }
  return result;
}

@end
