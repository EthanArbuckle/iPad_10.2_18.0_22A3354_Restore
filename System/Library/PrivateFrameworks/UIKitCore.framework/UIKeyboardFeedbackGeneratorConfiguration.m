@implementation UIKeyboardFeedbackGeneratorConfiguration

void __65___UIKeyboardFeedbackGeneratorConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1104);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, &unk_1E1A97818);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1104);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, &unk_1E1A97830);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1156);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, &unk_1E1A97848);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1155);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, &unk_1E1A97860);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1155);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, &unk_1E1A97878);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1155);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, &unk_1E1A97890);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1156);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, &unk_1E1A978A8);

  +[_UICustomDiscreteFeedback customDiscreteFeedbackWithEventType:systemSoundID:](_UICustomDiscreteFeedback, "customDiscreteFeedbackWithEventType:systemSoundID:", 0, 1156);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, &unk_1E1A978C0);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v2;
  objc_msgSend(v2, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(v15, "_individualFeedbacks");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v31;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v31 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
              if (objc_msgSend(v21, "_effectivePlayableFeedbackTypes") == 1)
                v22 = CFSTR("keyboard");
              else
                v22 = CFSTR("effects");
              objc_msgSend(v21, "_setCategory:", v22);
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v18);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v12);
  }

  objc_msgSend(v24, "setFeedbacks:", v23);
  objc_msgSend(v24, "setScalingForSpeedEnabled:", 0);
  objc_msgSend(v24, "setSlowTypingTime:", 0.5);
  objc_msgSend(v24, "setFastTypingTime:", 0.1);
  objc_msgSend(v24, "setFastTypingVolumeMultiplier:", 0.35);

}

@end
