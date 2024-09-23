@implementation PKPaymentInstructions

- (PKPaymentInstructions)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("instructions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_decodeHexadecimal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("signature"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pk_decodeHexadecimal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("fortifiedInstructions"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pk_decodeHexadecimal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("fortifiedSignature"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "pk_decodeHexadecimal");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass() & (v8 != 0);
  if (!v10)
    v16 = 0;
  if (v16 != 1 || v6 != 2)
  {
    if (!v16)
      goto LABEL_10;
LABEL_9:
    self->_version = v6;
    objc_storeStrong((id *)&self->_instructionsDictionary, v15);
    objc_storeStrong((id *)&self->_instructionsData, v8);
    objc_storeStrong((id *)&self->_signatureData, v10);
    objc_storeStrong((id *)&self->_fortifiedInstructionsData, v12);
    objc_storeStrong((id *)&self->_fortifiedSignatureData, v14);
    goto LABEL_10;
  }
  if (v12 && v14)
    goto LABEL_9;
LABEL_10:

  return self;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; version: %d; instructions: %tu bytes; signature: %tu bytes; "),
    v5,
    self,
    self->_version,
    -[NSData length](self->_instructionsData, "length"),
    -[NSData length](self->_signatureData, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_version == 2)
    objc_msgSend(v6, "appendFormat:", CFSTR("fortifiedInstructions: %tu bytes; fortifiedSignature: %tu bytes; "),
      -[NSData length](self->_fortifiedInstructionsData, "length"),
      -[NSData length](self->_fortifiedSignatureData, "length"));
  -[PKPaymentInstructions allImageKeys](self, "allImageKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%tu images: { "), objc_msgSend(v7, "count"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[PKPaymentInstructions _imageDataForImageWithKey:format:](self, "_imageDataForImageWithKey:format:", v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendFormat:", CFSTR("%@: %tu bytes, "), v13, objc_msgSend(v14, "length"));

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "appendString:", CFSTR("}; >"));
  v15 = (void *)objc_msgSend(v6, "copy");

  return v15;
}

- (NSArray)allImageKeys
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_instructionsDictionary, "objectForKey:", CFSTR("images"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (CGImage)imageForKey:(id)a3
{
  CGImage *result;
  CGImage *v4;
  CGImage *v5;

  result = -[PKPaymentInstructions _createImageDataProviderForImageKey:](self, "_createImageDataProviderForImageKey:", a3);
  if (result)
  {
    v4 = result;
    v5 = CGImageCreateWithPNGDataProvider(result, 0, 0, kCGRenderingIntentDefault);
    CFRelease(v4);
    return v5;
  }
  return result;
}

- (BOOL)archiveToDirectoryAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  int v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  BOOL v43;
  void *v45;
  id v46;
  void *v47;
  id *v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("DFR_%ld"), llround(v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v58);
    v15 = v58;

    if (!v17)
    {
      v43 = 0;
      if (!a4)
        goto LABEL_26;
      goto LABEL_25;
    }
  }
  v57 = v15;
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v11, 1, &v57);
  v19 = v57;

  if (v18)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PKPaymentInstructions version](self, "version"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("version"));

    -[PKPaymentInstructions instructionsData](self, "instructionsData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("instructions"));

    -[PKPaymentInstructions signatureData](self, "signatureData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("signature"));

    -[PKPaymentInstructions fortifiedInstructionsData](self, "fortifiedInstructionsData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("fortifiedInstructions"));

    -[PKPaymentInstructions fortifiedSignatureData](self, "fortifiedSignatureData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("fortifiedSignature"));

    v56 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v20, 100, 0, &v56);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v56;

    if (v26)
    {
      v45 = v26;
      v46 = v20;
      v47 = v11;
      v48 = a4;
      v49 = v6;
      v28 = (id)objc_msgSend(v18, "addRegularFileWithContents:preferredFilename:", v26, CFSTR("Instructions.plist"));
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      -[PKPaymentInstructions allImageKeys](self, "allImageKeys");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v53 != v32)
              objc_enumerationMutation(v29);
            v34 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
            v51 = 0;
            -[PKPaymentInstructions _imageDataForImageWithKey:format:](self, "_imageDataForImageWithKey:format:", v34, &v51);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = v51;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v34, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (id)objc_msgSend(v18, "addRegularFileWithContents:preferredFilename:", v35, v37);

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v52, v63, 16);
        }
        while (v31);
      }

      v50 = v27;
      v11 = v47;
      v39 = objc_msgSend(v18, "writeToURL:options:originalContentsURL:error:", v47, 1, 0, &v50);
      v19 = v50;

      if (v39)
      {
        PKLogFacilityTypeGetObject(7uLL);
        v40 = objc_claimAutoreleasedReturnValue();
        a4 = v48;
        v6 = v49;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v42;
          v61 = 2112;
          v62 = v47;
          _os_log_impl(&dword_18FC92000, v40, OS_LOG_TYPE_DEFAULT, "Archived latest %{public}@ at %@", buf, 0x16u);

        }
        v43 = 1;
      }
      else
      {
        v43 = 0;
        a4 = v48;
        v6 = v49;
      }
      v26 = v45;
      v20 = v46;
    }
    else
    {
      v43 = 0;
      v19 = v27;
    }
    -[PKPaymentInstructions _pruneDirectoryAtURL:](self, "_pruneDirectoryAtURL:", v6);

  }
  else
  {
    v43 = 0;
  }

  v15 = v19;
  if (a4)
LABEL_25:
    *a4 = objc_retainAutorelease(v15);
LABEL_26:

  return v43;
}

- (void)_pruneDirectoryAtURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 >= 0xB)
  {
    v8 = v7;
    v18 = v6;
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = v8 - 10;
    do
    {
      objc_msgSend(v9, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "URLByAppendingPathComponent:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeItemAtURL:error:", v13, 0);

      PKLogFacilityTypeGetObject(7uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2112;
        v22 = v13;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Deleted excess %{public}@ at %@", buf, 0x16u);

      }
      ++v10;
    }
    while (v11 != v10);

    v6 = v18;
  }

}

- (CGDataProvider)_createImageDataProviderForImageKey:(id)a3
{
  const __CFData *v3;
  id v4;
  CGDataProvider *v5;
  id v7;

  v7 = 0;
  -[PKPaymentInstructions _imageDataForImageWithKey:format:](self, "_imageDataForImageWithKey:format:", a3, &v7);
  v3 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  objc_opt_class();
  v5 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "caseInsensitiveCompare:", CFSTR("PNG")))
      v5 = 0;
    else
      v5 = CGDataProviderCreateWithCFData(v3);
  }

  return v5;
}

- (id)_imageDataForImageWithKey:(id)a3 format:(id *)a4
{
  NSDictionary *instructionsDictionary;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  instructionsDictionary = self->_instructionsDictionary;
  v6 = a3;
  -[NSDictionary objectForKey:](instructionsDictionary, "objectForKey:", CFSTR("images"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("format"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)instructionsData
{
  return self->_instructionsData;
}

- (void)setInstructionsData:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsData, a3);
}

- (NSData)signatureData
{
  return self->_signatureData;
}

- (void)setSignatureData:(id)a3
{
  objc_storeStrong((id *)&self->_signatureData, a3);
}

- (NSData)fortifiedInstructionsData
{
  return self->_fortifiedInstructionsData;
}

- (void)setFortifiedInstructionsData:(id)a3
{
  objc_storeStrong((id *)&self->_fortifiedInstructionsData, a3);
}

- (NSData)fortifiedSignatureData
{
  return self->_fortifiedSignatureData;
}

- (void)setFortifiedSignatureData:(id)a3
{
  objc_storeStrong((id *)&self->_fortifiedSignatureData, a3);
}

- (NSDictionary)instructionsDictionary
{
  return self->_instructionsDictionary;
}

- (void)setInstructionsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsDictionary, 0);
  objc_storeStrong((id *)&self->_fortifiedSignatureData, 0);
  objc_storeStrong((id *)&self->_fortifiedInstructionsData, 0);
  objc_storeStrong((id *)&self->_signatureData, 0);
  objc_storeStrong((id *)&self->_instructionsData, 0);
}

@end
