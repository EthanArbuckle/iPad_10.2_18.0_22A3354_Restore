@implementation PKPaymentHeroImageSet

- (PKPaymentHeroImageSet)initWithDictionary:(id)a3
{
  id v5;
  PKPaymentHeroImageSet *v6;
  PKPaymentHeroImageSet *v7;

  v5 = a3;
  v6 = -[PKPaymentHeroImageSet init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_model, a3);

  return v7;
}

- (id)imageForPreferredLanguages:(id)a3 scale:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  PKPaymentHeroImageModel *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  uint8_t v22[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        -[NSDictionary objectForKey:](self->_model, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10));
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;

          goto LABEL_14;
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
        continue;
      break;
    }
  }

  -[NSDictionary objectForKey:](self->_model, "objectForKey:", CFSTR("base"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
LABEL_14:
    if (a4 <= 2.0)
      v14 = CFSTR("2x");
    else
      v14 = CFSTR("3x");
    v15 = v14;
    -[NSObject objectForKey:](v12, "objectForKey:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = v15;
    }
    else
    {
      if (a4 >= 3.0)
        v19 = CFSTR("2x");
      else
        v19 = CFSTR("3x");
      v18 = v19;

      -[NSObject objectForKey:](v12, "objectForKey:", v18);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
        v20 = v12;
      v17 = v20;
    }
    v13 = -[PKPaymentHeroImageModel initWithDictionary:]([PKPaymentHeroImageModel alloc], "initWithDictionary:", v17);

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find a matching language in hero image set", v22, 2u);
    }
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
