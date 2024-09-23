@implementation TUIIDMSDeviceSource

- (TUIIDMSDeviceSource)initWithIdmsDeviceProtocol:(id)a3
{
  id v4;
  TUIIDMSDeviceSource *v5;
  TUIIDMSDeviceSource *v6;
  id v7;
  TUIIDMSDeviceSource *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIIDMSDeviceSource;
  v5 = -[TUIIDMSDeviceSource init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[TUIIDMSDeviceSource setD:](v5, "setD:", v4);
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x24BEBA848]);
      -[TUIIDMSDeviceSource setD:](v6, "setD:", v7);

    }
    v8 = v6;
  }

  return v6;
}

- (id)mapDeviceWithMissing:(id)a3 aaDevices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  id v41;
  NSObject *v42;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TUIIDMSDeviceSource idmsDevices](self, "idmsDevices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v49 = v7;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIIDMSDeviceSource setIdmsDevices:](self, "setIdmsDevices:", v9);

    -[TUIIDMSDeviceSource d](self, "d");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend(v10, "transparencyIDMSDeviceList:", &v66);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v66;

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v63 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v18, "pushToken");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            -[TUIIDMSDeviceSource idmsDevices](self, "idmsDevices");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "pushToken");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v21);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v15);
    }

    v7 = v49;
  }
  -[TUIIDMSDeviceSource idmsDevices](self, "idmsDevices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIIDMSDeviceSource idmsDevices](self, "idmsDevices");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x24BDAC760];
    v59[1] = 3221225472;
    v59[2] = __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke_20;
    v59[3] = &unk_251A5ABE0;
    v60 = v23;
    v26 = v24;
    v61 = v26;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v59);

    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v27 = v26;
    v45 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
    if (v45)
    {
      v28 = *(_QWORD *)v56;
      v48 = v6;
      v50 = v7;
      v46 = v27;
      v47 = v23;
      v44 = *(_QWORD *)v56;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v56 != v28)
            objc_enumerationMutation(v27);
          v30 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v29);
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          v31 = v7;
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
          if (v32)
          {
            v33 = v32;
            v34 = *(_QWORD *)v52;
            while (2)
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v52 != v34)
                  objc_enumerationMutation(v31);
                v36 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                objc_msgSend(v36, "pushToken", v44);
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (v37)
                {
                  objc_msgSend(v30, "pushToken");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "pushToken");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v40 = objc_msgSend(v38, "isEqual:", v39);

                  if ((v40 & 1) != 0)
                  {
                    v41 = v36;

                    v6 = v48;
                    v7 = v50;
                    v27 = v46;
                    v23 = v47;
                    goto LABEL_37;
                  }
                }
              }
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
              if (v33)
                continue;
              break;
            }
          }

          ++v29;
          v27 = v46;
          v6 = v48;
          v7 = v50;
          v23 = v47;
          v28 = v44;
        }
        while (v29 != v45);
        v41 = 0;
        v45 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      }
      while (v45);
    }
    else
    {
      v41 = 0;
    }
LABEL_37:

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK, &__block_literal_global);
    v42 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
      -[TUIIDMSDeviceSource mapDeviceWithMissing:aaDevices:].cold.1((uint64_t)v6, (uint64_t)self, v42);
    v41 = 0;
  }

  return v41;
}

void __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL = (uint64_t)v0;

}

void __54__TUIIDMSDeviceSource_mapDeviceWithMissing_aaDevices___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "serial");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serial");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);

}

- (TransparencyIDMSDeviceProtocol)d
{
  return (TransparencyIDMSDeviceProtocol *)objc_getProperty(self, a2, 8, 1);
}

- (void)setD:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)idmsDevices
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdmsDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idmsDevices, 0);
  objc_storeStrong((id *)&self->_d, 0);
}

- (void)mapDeviceWithMissing:(os_log_t)log aaDevices:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[TUIIDMSDeviceSource mapDeviceWithMissing:aaDevices:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_2493EE000, log, OS_LOG_TYPE_ERROR, "%s device unknown for IDMS list too: %@ on %{public}@", (uint8_t *)&v3, 0x20u);
}

@end
