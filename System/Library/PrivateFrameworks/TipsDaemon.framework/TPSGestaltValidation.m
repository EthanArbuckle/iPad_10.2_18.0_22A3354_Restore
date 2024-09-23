@implementation TPSGestaltValidation

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSDeviceCapabilityValidation queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[TPSDeviceCapabilityValidation queries](self, "queries");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MGCopyMultipleAnswers();

    if (v9)
    {
      v28 = v4;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[TPSDeviceCapabilityValidation queries](self, "queries");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allKeys");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v11;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v12)
      {
        v14 = v12;
        v15 = *(_QWORD *)v31;
        LOBYTE(v16) = 1;
        *(_QWORD *)&v13 = 138413058;
        v27 = v13;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v17);
            objc_msgSend(v9, "objectForKeyedSubscript:", v18, v27);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[TPSDeviceCapabilityValidation queries](self, "queries");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              v24 = (void *)objc_opt_class();
              *(_DWORD *)buf = v27;
              v35 = v24;
              v36 = 2112;
              v37 = v18;
              v38 = 2112;
              v39 = v19;
              v40 = 2112;
              v41 = v21;
              v25 = v24;
              _os_log_debug_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_DEBUG, "%@ - checking \"%@\"...Answer: %@. Expected: %@", buf, 0x2Au);

            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v19, "isEqual:", v21) & 1) != 0)
            {
              if ((v16 & 1) != 0)
              {
                v23 = 1;
                v16 = 1;
                if (-[TPSTargetingValidation joinType](self, "joinType") == 1)
                  goto LABEL_22;
              }
              else
              {
                v16 = 0;
              }
            }
            else
            {
              v23 = 0;
              v16 = 0;
              if (!-[TPSTargetingValidation joinType](self, "joinType"))
              {
LABEL_22:

                v16 = v23;
                goto LABEL_25;
              }
            }

            ++v17;
          }
          while (v14 != v17);
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          v14 = v26;
        }
        while (v26);
      }
      else
      {
        v16 = 1;
      }
LABEL_25:

      v4 = v28;
      (*((void (**)(id, uint64_t, _QWORD))v28 + 2))(v28, v16, 0);
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    }

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v4 + 2))(v4, 1, 0);
  }

}

@end
