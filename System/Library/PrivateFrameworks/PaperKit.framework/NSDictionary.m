@implementation NSDictionary

void __56__NSDictionary_Foundation_Extensions__muDeepMutableCopy__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
    }
    v7 = objc_msgSend(v6, "muDeepMutableCopy");
  }
  else if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F044E978))
  {
    v7 = objc_msgSend(v6, "mutableCopy");
  }
  else if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F044E8B0))
  {
    v7 = objc_msgSend(v6, "copy");
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v5);
    goto LABEL_14;
  }
LABEL_12:
  +[PPKImageWriter log]();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1DDB0F000, v8, OS_LOG_TYPE_DEFAULT, "Unable to copy object for [NSDictionary muDeepMutableCopy]: %@", (uint8_t *)&v9, 0xCu);
  }
LABEL_14:

}

@end
