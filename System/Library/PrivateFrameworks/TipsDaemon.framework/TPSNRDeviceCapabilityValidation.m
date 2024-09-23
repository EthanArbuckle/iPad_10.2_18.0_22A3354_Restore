@implementation TPSNRDeviceCapabilityValidation

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  void (**v32)(id, uint64_t, _QWORD);
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getActivePairedDevice");
  v6 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v6;
  if (v6)
  {
    -[TPSDeviceCapabilityValidation queries](self, "queries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v32 = v4;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      -[TPSDeviceCapabilityValidation queries](self, "queries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v10;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v36;
        LOBYTE(v15) = 1;
        *(_QWORD *)&v12 = 138412546;
        v31 = v12;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v36 != v14)
              objc_enumerationMutation(obj);
            v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v16);
            v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
            if (v18)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v34, "supportsCapability:", v18));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPSDeviceCapabilityValidation queries](self, "queries");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectForKeyedSubscript:", v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                v25 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138413058;
                v40 = v25;
                v41 = 2112;
                v42 = v17;
                v43 = 2112;
                v44 = v19;
                v45 = 2112;
                v46 = v21;
                v26 = v25;
                _os_log_debug_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEBUG, "%@ - checking \"%@\"...Answer: %@. Expected: %@", buf, 0x2Au);

              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v19, "isEqual:", v21) & 1) != 0)
              {
                if ((v15 & 1) != 0)
                {
                  v23 = 1;
                  v15 = 1;
                  if (-[TPSTargetingValidation joinType](self, "joinType") == 1)
                    goto LABEL_31;
                }
                else
                {
                  v15 = 0;
                }
              }
              else
              {
                v23 = 0;
                v15 = 0;
                if (!-[TPSTargetingValidation joinType](self, "joinType", v31))
                {
LABEL_31:

LABEL_32:
                  v15 = v23;
                  goto LABEL_33;
                }
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                v27 = (void *)objc_opt_class();
                *(_DWORD *)buf = v31;
                v40 = v27;
                v41 = 2112;
                v42 = v17;
                v28 = v27;
                _os_log_error_impl(&dword_1DAC2F000, v24, OS_LOG_TYPE_ERROR, "%@ - Invalid Key: %@", buf, 0x16u);

              }
              v23 = 0;
              v15 = 0;
              if (!-[TPSTargetingValidation joinType](self, "joinType"))
                goto LABEL_32;
            }

            ++v16;
          }
          while (v13 != v16);
          v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          v13 = v29;
        }
        while (v29);
      }
      else
      {
        v15 = 1;
      }
LABEL_33:

      v4 = v32;
      v32[2](v32, v15, 0);
    }
    else
    {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[TPSNRDeviceCapabilityValidation validateWithCompletion:].cold.1((uint64_t)self, v30);

    v4[2](v4, 0, 0);
  }

}

- (void)validateWithCompletion:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138412290;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_debug_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_DEBUG, "%@ - No active paired device", (uint8_t *)&v4, 0xCu);

}

@end
