@implementation APOdmlRecipeParser

- (id)formatRecipe:(id)a3 attachments:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  id v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  id v21;
  const char *v22;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend_count(v9, v10, v11))
  {
    objc_msgSend_modelFileName(v8, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__attachmentURLWithName_fileName_(self, v15, (uint64_t)v9, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = v16;
    }
    else
    {
      OdmlLogForCategory(0xBuLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = 138412546;
        v25 = (id)objc_opt_class();
        v26 = 2112;
        v27 = 0;
        v21 = v25;
        _os_log_impl(&dword_1B69D6000, v20, OS_LOG_TYPE_ERROR, "[%@]: No network found at URL: %@", (uint8_t *)&v24, 0x16u);

      }
      if (a5)
      {
        objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v22, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8009, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    OdmlLogForCategory(0xBuLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1B69D6000, v18, OS_LOG_TYPE_ERROR, "There are no attachments.", (uint8_t *)&v24, 2u);
    }

    if (a5)
    {
      objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], v19, (uint64_t)CFSTR("APODMLDESPluginErrorDomain"), 8011, 0);
      v16 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

- (id)_attachmentURLWithName:(id)a3 fileName:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1B69FA438;
  v15[3] = &unk_1E6A29E00;
  v7 = v6;
  v16 = v7;
  v9 = objc_msgSend_indexOfObjectPassingTest_(v5, v8, (uint64_t)v15);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    OdmlLogForCategory(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B69D6000, v11, OS_LOG_TYPE_ERROR, "Network not found.", v14, 2u);
    }

    v12 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v5, v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
