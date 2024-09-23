@implementation PLFileSystemCapabilities

+ (unint64_t)minimumAvailableBytesRequiredForLibraryOpen
{
  return 52428800;
}

- (BOOL)supportsDataProtection
{
  return self->_supportsDataProtection;
}

- (BOOL)determineCapabilitiesWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  void *v18;
  void *v19;
  NSError *v20;
  NSError *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSError *v26;
  NSError *error;
  BOOL v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int *v35;
  id v36;
  void *v37;
  NSError *v38;
  NSError *v39;
  NSError *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  id v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _DWORD v57[7];
  char v58;
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  statfs v64;
  _QWORD v65[2];
  _QWORD v66[5];

  v66[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4)
    v8 = a4;
  else
    v8 = (id *)&v58;
  if (!v6)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2FE0];
    v24 = *MEMORY[0x1E0CB2D68];
    v65[0] = *MEMORY[0x1E0CB2938];
    v65[1] = v24;
    v66[0] = CFSTR("nil URL");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", strerror(22));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v66[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 22, v25);
    v26 = (NSError *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v26;

    *v8 = objc_retainAutorelease(v26);
    goto LABEL_8;
  }
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v64, 0, 512);
  v10 = objc_retainAutorelease(v9);
  if (!statfs((const char *)objc_msgSend(v10, "fileSystemRepresentation"), &v64))
  {
    v56 = 0u;
    memset(v57, 0, sizeof(v57));
    v54 = 0u;
    v55 = 0u;
    v52 = xmmword_199EB0C28;
    v53 = 0;
    if (getattrlist(v64.f_mntonname, &v52, &v54, 0x4CuLL, 0))
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2FE0];
      v31 = *__error();
      v32 = *MEMORY[0x1E0CB2938];
      v61[0] = CFSTR("error finding volume attributes");
      v33 = *MEMORY[0x1E0CB2D68];
      v60[0] = v32;
      v60[1] = v33;
      v34 = (void *)MEMORY[0x1E0CB3940];
      v35 = __error();
      objc_msgSend(v34, "stringWithUTF8String:", strerror(*v35));
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v60[2] = *MEMORY[0x1E0CB3308];
      v61[1] = v36;
      v61[2] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, v31, v37);
      v38 = (NSError *)objc_claimAutoreleasedReturnValue();
      v39 = self->_error;
      self->_error = v38;

      v40 = objc_retainAutorelease(v38);
    }
    else
    {
      v41 = *MEMORY[0x1E0C99C00];
      v42 = *MEMORY[0x1E0C99BF0];
      v59[0] = *MEMORY[0x1E0C99C00];
      v59[1] = v42;
      v50 = *MEMORY[0x1E0C99C18];
      v59[2] = *MEMORY[0x1E0C99C18];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v10, "resourceValuesForKeys:error:", v43, &v51);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v51;
      v36 = v51;

      if (v37)
      {
        strlcpy(self->_fstypename, v64.f_fstypename, 0x10uLL);
        self->_isReadOnly = v64.f_flags & 1;
        v45 = v57[2];
        self->_interfacesCapabilities = DWORD2(v54) & DWORD2(v55);
        self->_nativeCommonAttributes = v45;
        objc_msgSend(v37, "objectForKeyedSubscript:", v41);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isLocalVolume = objc_msgSend(v46, "BOOLValue");

        objc_msgSend(v37, "objectForKeyedSubscript:", v42);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isInternalVolume = objc_msgSend(v47, "BOOLValue");

        objc_msgSend(v37, "objectForKeyedSubscript:", v50);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        self->_isRootFileSystemVolume = objc_msgSend(v48, "BOOLValue");

        self->_supportsDataProtection = (v64.f_flags & 0x80) != 0;
        v28 = 1;
        self->_isValid = 1;
        goto LABEL_14;
      }
      objc_storeStrong((id *)&self->_error, v44);
      v40 = (NSError *)objc_retainAutorelease(v36);
      v36 = v40;
    }
    v28 = 0;
    *v8 = v40;
LABEL_14:

    goto LABEL_15;
  }
  v11 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2FE0];
  v13 = *__error();
  v14 = *MEMORY[0x1E0CB2938];
  v63[0] = CFSTR("error finding filesystem information");
  v15 = *MEMORY[0x1E0CB2D68];
  v62[0] = v14;
  v62[1] = v15;
  v16 = (void *)MEMORY[0x1E0CB3940];
  v17 = __error();
  objc_msgSend(v16, "stringWithUTF8String:", strerror(*v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = *MEMORY[0x1E0CB3308];
  v63[1] = v18;
  v63[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v19);
  v20 = (NSError *)objc_claimAutoreleasedReturnValue();
  v21 = self->_error;
  self->_error = v20;

  *v8 = objc_retainAutorelease(v20);
LABEL_8:
  v28 = 0;
LABEL_15:

  return v28;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (PLFileSystemCapabilities)capabilitiesWithURL:(id)a3
{
  id v3;
  PLFileSystemCapabilities *v4;

  v3 = a3;
  v4 = objc_alloc_init(PLFileSystemCapabilities);
  -[PLFileSystemCapabilities determineCapabilitiesWithURL:error:](v4, "determineCapabilitiesWithURL:error:", v3, 0);

  return v4;
}

- (BOOL)isCloneCapable
{
  return BYTE2(self->_interfacesCapabilities) & 1;
}

- (BOOL)isWholeFileLockCapable
{
  return (self->_interfacesCapabilities & 0x1200) != 0;
}

- (BOOL)isGenCountCapable
{
  return (BYTE2(self->_nativeCommonAttributes) >> 3) & 1;
}

- (NSString)fileSystemTypeName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_fstypename);
}

- (BOOL)isNetworkVolume
{
  return self->_isValid && !self->_isLocalVolume;
}

- (BOOL)isCentralizedCacheDeleteCapable
{
  if (isCentralizedCacheDeleteCapable_onceToken != -1)
    dispatch_once(&isCentralizedCacheDeleteCapable_onceToken, &__block_literal_global_7419);
  return isCentralizedCacheDeleteCapable_supportsCCDDefault && -[PLFileSystemCapabilities isValid](self, "isValid");
}

- (id)description
{
  BOOL v3;
  void *v4;
  void *v5;
  NSError *error;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[PLFileSystemCapabilities isValid](self, "isValid");
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v3)
  {
    -[PLFileSystemCapabilities fileSystemTypeName](self, "fileSystemTypeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("type:%@ readOnly:%d clone:%d flock:%d genCount:%d seclude:%d local:%d internal:%d"), v5, -[PLFileSystemCapabilities isReadOnly](self, "isReadOnly"), -[PLFileSystemCapabilities isCloneCapable](self, "isCloneCapable"), -[PLFileSystemCapabilities isWholeFileLockCapable](self, "isWholeFileLockCapable"), -[PLFileSystemCapabilities isGenCountCapable](self, "isGenCountCapable"), -[PLFileSystemCapabilities isSecludeRenameCapable](self, "isSecludeRenameCapable"), -[PLFileSystemCapabilities isLocalVolume](self, "isLocalVolume"), -[PLFileSystemCapabilities isInternalVolume](self, "isInternalVolume"));
  }
  else
  {
    error = self->_error;
    if (!error)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("invalid: %@"), CFSTR("uninitialized"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    -[NSError localizedDescription](error, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("invalid: %@"), v5, v9, v10, v11, v12, v13, v14, v15);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (BOOL)isLocalVolume
{
  return self->_isLocalVolume;
}

- (BOOL)isInternalVolume
{
  return self->_isInternalVolume;
}

- (BOOL)isRootFileSystemVolume
{
  return self->_isRootFileSystemVolume;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

void __59__PLFileSystemCapabilities_isCentralizedCacheDeleteCapable__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("PLSupportsCCD"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 1;
  }
  isCentralizedCacheDeleteCapable_supportsCCDDefault = v2;

}

@end
