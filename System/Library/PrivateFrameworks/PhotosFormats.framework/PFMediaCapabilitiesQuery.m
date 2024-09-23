@implementation PFMediaCapabilitiesQuery

- (PFMediaCapabilitiesQuery)init
{
  return -[PFMediaCapabilitiesQuery initWithOptions:](self, "initWithOptions:", MEMORY[0x1E0C9AA70]);
}

- (PFMediaCapabilitiesQuery)initWithOptions:(id)a3
{
  id v4;
  PFMediaCapabilitiesQuery *v5;
  uint64_t v6;
  NSMutableDictionary *capabilitiesInformation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFMediaCapabilitiesQuery;
  v5 = -[PFMediaCapabilitiesQuery init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_opt_new();
    capabilitiesInformation = v5->_capabilitiesInformation;
    v5->_capabilitiesInformation = (NSMutableDictionary *)v6;

    -[PFMediaCapabilitiesQuery gatherCapabilitiesWithOptions:](v5, "gatherCapabilitiesWithOptions:", v4);
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  return self->_capabilitiesInformation;
}

- (void)gatherCapabilitiesWithOptions:(id)a3
{
  id v4;

  v4 = a3;
  -[PFMediaCapabilitiesQuery addVersion](self, "addVersion");
  -[PFMediaCapabilitiesQuery addCodecInformation](self, "addCodecInformation");
  -[PFMediaCapabilitiesQuery addVendorSpecificInformationWithOptions:](self, "addVendorSpecificInformationWithOptions:", v4);
  -[PFMediaCapabilitiesQuery addTranscodeChoiceWithOptions:](self, "addTranscodeChoiceWithOptions:", v4);
  -[PFMediaCapabilitiesQuery addSortSourceEnumerationAscendingWithOptions:](self, "addSortSourceEnumerationAscendingWithOptions:", v4);

}

- (void)addVersion
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", &unk_1E45CA4F0, CFSTR("Version"));
}

- (void)addCodecInformation
{
  void *v3;
  id v4;

  v4 = (id)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v4, CFSTR("Codecs"));
  -[PFMediaCapabilitiesQuery addVersion1And2HEVCCodecInformationToDictionary:](self, "addVersion1And2HEVCCodecInformationToDictionary:", v4);
  -[PFMediaCapabilitiesQuery addCodecSupportInformationToDictionary:](self, "addCodecSupportInformationToDictionary:", v4);
  v3 = (void *)objc_opt_new();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v3, CFSTR("ContainerFormats"));
  -[PFMediaCapabilitiesQuery addHEIFContainerInformationToDictionary:](self, "addHEIFContainerInformationToDictionary:", v3);

}

- (void)addVersion1And2HEVCCodecInformationToDictionary:(id)a3
{
  id v3;
  int VideoDecoderInstance;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  _BOOL4 v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  VideoDecoderInstance = VTSelectAndCreateVideoDecoderInstance();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    v9 = VideoDecoderInstance == 0;
    v10 = 1024;
    v11 = VideoDecoderInstance;
    _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Has HEVC codec: %d, status = %x", buf, 0xEu);
  }
  if (!VideoDecoderInstance)
  {
    v5 = (void *)objc_opt_new();
    v6 = (void *)VTCopyHEVCDecoderCapabilitiesDictionary();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("Profiles"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), 104, 118, 99, 49);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v7);

  }
}

- (void)addCodecSupportInformationToDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PFMediaCapabilities videoCodecTypesEligibleForBackwardsCompatibilityTranscoding](PFMediaCapabilities, "videoCodecTypesEligibleForBackwardsCompatibilityTranscoding");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)VTCopyDecoderCapabilitiesDictionaryForCodecTypes();
  if (v5)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("CodecSupport"));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get codec support information for codec types %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)addHEIFContainerInformationToDictionary:(id)a3
{
  CFArrayRef v3;
  void *v4;
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  uint8_t buf[4];
  const __CFArray *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v3 = CGImageSourceCopyTypeIdentifiers();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x1E0CEC698];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "conformsToType:", v9);

        if (v13)
          objc_msgSend(v4, "addObject:", v11);
      }
      v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    v22 = CFSTR("HeifSubtypes");
    v23 = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC698], "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v15);

  }
  else
  {
    v16 = v17;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v5;
      _os_log_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "System has no HEIF support, known identifiers = %@", buf, 0xCu);
    }
  }

}

- (void)addVendorSpecificInformationWithOptions:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMediaCapabilitiesQuery addLivePhotoInformationToDictionary:](self, "addLivePhotoInformationToDictionary:", v6);
  -[PFMediaCapabilitiesQuery addAssetBundleInformationToDictionary:](self, "addAssetBundleInformationToDictionary:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SupportsAdjustmentBaseResources"));
  v9 = CFSTR("com.apple");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v7, CFSTR("Vendor"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WantsPlatformInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[PFMediaCapabilitiesQuery addPlatformInformation](self, "addPlatformInformation");

}

- (void)addPlatformInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)_CFCopySystemVersionDictionary();
  v9[0] = CFSTR("Apple");
  v8[0] = CFSTR("PFMediaCapabilitiesPlatformVendorKey");
  v8[1] = CFSTR("PFMediaCapabilitiesPlatformNameKey");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("PFMediaCapabilitiesPlatformVersionKey");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  v8[3] = CFSTR("PFMediaCapabilitiesPlatformBuildVersionKey");
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = CFSTR("PFMediaCapabilitiesPlatformTransportKey");
  v9[3] = v6;
  v9[4] = CFSTR("PTP");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v7, CFSTR("PFMediaCapabilitiesPlatformInfoKey"));
}

- (void)addPlatformInformationFromDictionary:(id)a3
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", a3, CFSTR("PFMediaCapabilitiesPlatformInfoKey"));
}

- (void)addTranscodeChoiceWithOptions:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SupportsTranscodeChoice"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v4, CFSTR("TranscodeChoice"));

}

- (void)addSortSourceEnumerationAscendingWithOptions:(id)a3
{
  id v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("SortSourceEnumerationAscending"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_capabilitiesInformation, "setObject:forKeyedSubscript:", v4, CFSTR("SortSourceEnumerationAscending"));

}

- (void)addLivePhotoInformationToDictionary:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[PFVideoComplement currentFormatVersion](PFVideoComplement, "currentFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("LivePhotoFormatVersion"));

}

- (void)addAssetBundleInformationToDictionary:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[PFAssetBundle currentFormatVersion](PFAssetBundle, "currentFormatVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("AssetBundleFormatVersion"));

}

- (NSMutableDictionary)capabilitiesInformation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCapabilitiesInformation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesInformation, 0);
}

@end
