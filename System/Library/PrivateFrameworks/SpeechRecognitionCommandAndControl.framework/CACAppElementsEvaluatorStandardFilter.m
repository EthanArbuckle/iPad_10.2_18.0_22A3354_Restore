@implementation CACAppElementsEvaluatorStandardFilter

- (id)actionableAXElementsFromAXElements:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v18;
    v10 = *MEMORY[0x24BDFEEF0] | *MEMORY[0x24BDFEE60] | *MEMORY[0x24BDFF008] | *MEMORY[0x24BDFEEE8] | *MEMORY[0x24BDFEEA0] | *MEMORY[0x24BDFF0C8] | *MEMORY[0x24BDFEEE0];
    *(_QWORD *)&v7 = 138478083;
    v16 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasAnyTraits:", v10, v16, (_QWORD)v17))
        {
          objc_msgSend(v4, "addObject:", v12);
        }
        else
        {
          CACLogElementEvaluation();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "traits");
            v14 = _AXTraitsAsString();
            *(_DWORD *)buf = v16;
            v22 = v12;
            v23 = 2112;
            v24 = v14;
            _os_log_debug_impl(&dword_229A40000, v13, OS_LOG_TYPE_DEBUG, "Filtering %{private}@ with traits %@", buf, 0x16u);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v8);
  }

  return v4;
}

@end
