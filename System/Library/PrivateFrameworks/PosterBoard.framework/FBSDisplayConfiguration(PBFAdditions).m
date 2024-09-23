@implementation FBSDisplayConfiguration(PBFAdditions)

+ (id)pbf_displayConfigurationForDisplayContext:()PBFAdditions
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGRect v30;
  CGRect v31;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D23100], "pui_sharedDisplayMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v4, "connectedIdentities", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(v4, "configurationForIdentity:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v3, "pbf_referenceBounds");
      v31.origin.x = v19;
      v31.origin.y = v20;
      v31.size.width = v21;
      v31.size.height = v22;
      v30.origin.x = v12;
      v30.origin.y = v14;
      v30.size.width = v16;
      v30.size.height = v18;
      if (CGRectEqualToRect(v30, v31))
      {
        objc_msgSend(v10, "pointScale");
        objc_msgSend(v3, "pbf_scale");
        if ((BSFloatEqualToFloat() & 1) != 0)
          break;
      }

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v10 = 0;
  }

  return v10;
}

@end
