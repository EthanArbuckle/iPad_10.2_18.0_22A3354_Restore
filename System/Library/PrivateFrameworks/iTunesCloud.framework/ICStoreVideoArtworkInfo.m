@implementation ICStoreVideoArtworkInfo

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (id)HLSVideoURLForAspectRatio:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[ICStoreVideoArtworkInfo _aspectRatioKeyForAspectRatio:](self, "_aspectRatioKeyForAspectRatio:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToHLSVideoURL, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
      v8 = v5;
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)previewFrameArtworkInfoMatchingAspectRatio:(double)a3
{
  void *v4;
  void *v5;

  -[ICStoreVideoArtworkInfo _aspectRatioKeyForAspectRatio:](self, "_aspectRatioKeyForAspectRatio:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToPreviewFrameArtworkInfo, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_aspectRatioKeyForAspectRatio:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToCRABSVideoDictionaries, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v5;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSDictionary allKeys](self->_aspectRatioToCRABSVideoDictionaries, "allKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v8);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "doubleValue");
          if (vabdd_f64(v12, a3) <= 0.12)
          {
            v7 = v11;
            goto LABEL_13;
          }
        }
        v7 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v7;
}

void __66__ICStoreVideoArtworkInfo_initWithVideoArtworkResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  ICStoreArtworkInfo *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  float v28;
  double v29;
  float v30;
  double v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  ICStoreArtworkInfo *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  NSObject *log;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("previewFrame"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v6 = -[ICStoreArtworkInfo initWithArtworkResponseDictionary:]([ICStoreArtworkInfo alloc], "initWithArtworkResponseDictionary:", v5);
      if (v6)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("width"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("height"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v43 = a1;
          objc_msgSend(v7, "doubleValue");
          v10 = v9;
          objc_msgSend(v8, "doubleValue");
          v12 = v10 / v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("video"));
          v14 = objc_claimAutoreleasedReturnValue();
          v40 = v6;
          v41 = v5;
          v38 = v8;
          v39 = v7;
          v36 = (void *)v14;
          v37 = (void *)v13;
          if (_NSIsNSString())
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v14);
            v34 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = 0;
          }
          v42 = v4;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("videoFile"), v34);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v48;
            v20 = CFSTR("height");
            v46 = v16;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v48 != v19)
                  objc_enumerationMutation(v16);
                v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                if (_NSIsNSDictionary())
                {
                  objc_msgSend(v22, "objectForKey:", CFSTR("width"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKey:", v20);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v25 = v20;
                    objc_msgSend(v22, "objectForKey:", CFSTR("assetUrl"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    if (_NSIsNSString() && objc_msgSend(v26, "length"))
                    {
                      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v26);
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v27)
                      {
                        objc_msgSend(v23, "floatValue");
                        v29 = v28;
                        objc_msgSend(v24, "floatValue");
                        v31 = v29 / v30;
                        if (vabdd_f64(v12, v31) <= 0.12)
                        {
                          objc_msgSend(v44, "addObject:", v22);
                          v12 = v31;
                        }
                        else
                        {
                          log = os_log_create("com.apple.amp.iTunesCloud", "StoreArtworkInfo");
                          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                          {
                            v32 = *(_QWORD *)(v43 + 32);
                            *(_DWORD *)buf = 134218754;
                            v52 = v32;
                            v53 = 2048;
                            v54 = v31;
                            v55 = 2048;
                            v56 = v12;
                            v57 = 2112;
                            v58 = v22;
                            _os_log_impl(&dword_1A03E3000, log, OS_LOG_TYPE_ERROR, "NSURL: %p -initWithMasterPlaylistURL: Omitting video dictionary [received video dictionary with inconsistent aspect ratio] currentAspectRatio=%f aspectRatio=%f videoDictionary=%@", buf, 0x2Au);
                          }

                        }
                      }

                    }
                    v20 = v25;
                    v16 = v46;
                  }

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v18);
          }

          objc_msgSend(*(id *)(v43 + 40), "setObject:forKeyedSubscript:", v44, v37);
          if (v35)
          {
            objc_msgSend(*(id *)(v43 + 48), "setObject:forKeyedSubscript:", v35, v37);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", &stru_1E4391778);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v43 + 48), "setObject:forKeyedSubscript:", v33, v37);

          }
          v6 = v40;
          v5 = v41;
          v8 = v38;
          v7 = v39;
          objc_msgSend(*(id *)(v43 + 56), "setObject:forKeyedSubscript:", v40, v37);

          v4 = v42;
        }

      }
    }

  }
}

- (ICStoreVideoArtworkInfo)initWithVideoArtworkResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ICStoreVideoArtworkInfo *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  ICStoreVideoArtworkInfo *v28;
  id *p_isa;
  ICStoreVideoArtworkInfo *v30;
  id v32;
  id v33;
  void *v35;
  id v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  ICStoreVideoArtworkInfo *v43;
  id v44;
  id v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __66__ICStoreVideoArtworkInfo_initWithVideoArtworkResponseDictionary___block_invoke;
  v42[3] = &unk_1E4390CD0;
  v8 = self;
  v43 = v8;
  v33 = v5;
  v9 = v5;
  v44 = v9;
  v32 = v6;
  v36 = v6;
  v45 = v36;
  v10 = v7;
  v46 = v10;
  v35 = v4;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v42);
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v9, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v18, "compare:", v12) == 1)
        {
          v19 = v18;

          v12 = v19;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v15);
  }

  objc_msgSend(v10, "objectForKeyedSubscript:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "absoluteString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "lastObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("assetUrl"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pf=%@/hls=%@/crabs=%@"), v21, v24, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = v8;
  v37.super_class = (Class)ICStoreVideoArtworkInfo;
  v28 = -[ICStoreVideoArtworkInfo init](&v37, sel_init);
  p_isa = (id *)&v28->super.isa;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_responseDictionary, a3);
    objc_storeStrong(p_isa + 1, v33);
    objc_storeStrong(p_isa + 2, v32);
    objc_storeStrong(p_isa + 3, v7);
    objc_storeStrong(p_isa + 4, v27);
  }
  v30 = p_isa;

  return v30;
}

- (id)supportedSizesForCRABSVideoForAspectRatio:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[ICStoreVideoArtworkInfo _aspectRatioKeyForAspectRatio:](self, "_aspectRatioKeyForAspectRatio:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToPreviewFrameArtworkInfo, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v4;
    -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToCRABSVideoDictionaries, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKey:", CFSTR("width"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("height"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "doubleValue");
          v15 = v14;
          objc_msgSend(v13, "doubleValue");
          v17 = v16;
          objc_msgSend(v5, "originalSize");
          if (v15 < v18)
          {
            objc_msgSend(v5, "originalSize");
            if (v17 < v19)
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v15, v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
                objc_msgSend(v23, "addObject:", v20);

            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v8);
    }

    v4 = v22;
  }

  return v23;
}

- (id)CRABSVideoURLMatchingSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  -[ICStoreVideoArtworkInfo _aspectRatioKeyForAspectRatio:](self, "_aspectRatioKeyForAspectRatio:", a3.width / a3.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v29 = v6;
    -[NSDictionary objectForKeyedSubscript:](self->_aspectRatioToCRABSVideoDictionaries, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v30 = 0;
      v10 = *(_QWORD *)v32;
      v11 = CFSTR("width");
      v12 = CFSTR("height");
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKey:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "doubleValue");
          v18 = v17;
          objc_msgSend(v16, "doubleValue");
          v20 = vabdd_f64(v19, height);
          if (vabdd_f64(v18, width) <= 0.00000011920929 && v20 <= 0.00000011920929)
          {
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("assetUrl"), v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v22);
            v23 = v12;
            v24 = v11;
            v25 = v7;
            v26 = objc_claimAutoreleasedReturnValue();

            v30 = (void *)v26;
            v7 = v25;
            v11 = v24;
            v12 = v23;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }
    else
    {
      v30 = 0;
    }

    v6 = v29;
    v27 = v30;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (BOOL)isEqual:(id)a3
{
  ICStoreVideoArtworkInfo *v4;
  NSDictionary *responseDictionary;
  NSDictionary *v6;
  char v7;

  v4 = (ICStoreVideoArtworkInfo *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (-[ICStoreVideoArtworkInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    responseDictionary = self->_responseDictionary;
    -[ICStoreVideoArtworkInfo responseDictionary](v4, "responseDictionary");
    v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (responseDictionary == v6)
      v7 = 1;
    else
      v7 = -[NSDictionary isEqual:](responseDictionary, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v3 ^ 0x6C7967656E657261;
  v8 = v4 ^ 0x646F72616E646F6DLL;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v8) ^ __ROR8__(v8, 51);
  v14 = v7 + v12;
  v15 = (v7 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v8, 32);
  v58 = __ROR8__(v14 + v13, 32);
  v60 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v56 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_responseDictionary;
  v19 = -[NSDictionary hash](v18, "hash");
  v20 = (v17 + v56) ^ __ROR8__(v56, 51);
  v21 = v58 + (v60 ^ v19);
  v22 = __ROR8__(v60 ^ v19, 48);
  v23 = (v21 ^ v22) + __ROR8__(v17 + v56, 32);
  v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  v25 = v21 + v20;
  v59 = __ROR8__(v25, 32);
  v61 = v24;
  v55 = v23 ^ v19;
  v57 = v25 ^ __ROR8__(v20, 47);

  v26 = (v55 + v57) ^ __ROR8__(v57, 51);
  v27 = v59 + (v61 ^ 0x1000000000000000);
  v28 = __ROR8__(v61 ^ 0x1000000000000000, 48);
  v29 = (v27 ^ v28) + __ROR8__(v55 + v57, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v32 = v31 ^ __ROR8__(v26, 47);
  v33 = (v29 ^ 0x1000000000000000) + v32;
  v34 = v33 ^ __ROR8__(v32, 51);
  v35 = (__ROR8__(v31, 32) ^ 0xFFLL) + v30;
  v36 = __ROR8__(v30, 48);
  v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  v39 = v34 + v35;
  v40 = v39 ^ __ROR8__(v34, 47);
  v41 = v40 + v37;
  v42 = v41 ^ __ROR8__(v40, 51);
  v43 = __ROR8__(v39, 32) + v38;
  v44 = __ROR8__(v38, 48);
  v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  v47 = v42 + v43;
  v48 = v47 ^ __ROR8__(v42, 47);
  v49 = v48 + v45;
  v50 = v49 ^ __ROR8__(v48, 51);
  v51 = __ROR8__(v47, 32) + v46;
  v52 = __ROR8__(v46, 48);
  v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  return (v50 + v51) ^ __ROR8__(v50, 47) ^ v53 ^ __ROR8__(v50 + v51, 32) ^ v53 ^ __ROR8__(v51 ^ v52, 43);
}

- (ICStoreVideoArtworkInfo)initWithCoder:(id)a3
{
  void *v4;
  ICStoreVideoArtworkInfo *v5;

  objc_msgSend(a3, "decodePropertyListForKey:", CFSTR("responseDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICStoreVideoArtworkInfo initWithVideoArtworkResponseDictionary:](self, "initWithVideoArtworkResponseDictionary:", v4);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_responseDictionary, CFSTR("responseDictionary"));
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_aspectRatioToPreviewFrameArtworkInfo, 0);
  objc_storeStrong((id *)&self->_aspectRatioToHLSVideoURL, 0);
  objc_storeStrong((id *)&self->_aspectRatioToCRABSVideoDictionaries, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
