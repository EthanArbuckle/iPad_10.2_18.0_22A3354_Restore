@implementation _UIFeedbackCoreHapticsPlayer

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)_internal_createFixedParameterForParameters:(id)a3 withKey:(id)a4 forEventType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  NSObject *v18;
  const char *v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  double v72;
  NSObject *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  id v92;
  void *v93;
  void *v94;
  id v95;
  id v96;
  uint8_t buf[4];
  uint64_t v98;
  __int16 v99;
  double v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[_UIFeedbackParameters parameters](_UIFeedbackParameters, "parameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_effectiveValueForParameterWithKey:", v8);
  v13 = v12;

  LODWORD(v10) = objc_msgSend(v9, "_isAudio");
  if ((_DWORD)v10)
    v14 = CFSTR("audioType");
  else
    v14 = CFSTR("hapticType");
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (int)objc_msgSend(v15, "intValue");

  switch(v16)
  {
    case 0:
      getCHHapticEventParameterIDAudioVolume();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_28;
      goto LABEL_47;
    case 1:
      getCHHapticEventParameterIDAudioPitch();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_47;
      goto LABEL_28;
    case 2:
    case 9:
      getCHHapticEventParameterIDAttackTime();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_47;
      goto LABEL_28;
    case 3:
    case 10:
      getCHHapticEventParameterIDDecayTime();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_47;
      goto LABEL_28;
    case 4:
    case 11:
      getCHHapticEventParameterIDReleaseTime();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_47;
      goto LABEL_28;
    case 5:
      getCHHapticEventParameterIDAudioPan();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        goto LABEL_28;
      goto LABEL_47;
    case 6:
    case 8:
    case 12:
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_47;
      v17 = qword_1ECD7AAC8;
      if (!qword_1ECD7AAC8)
      {
        v17 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v17, (unint64_t *)&qword_1ECD7AAC8);
      }
      if ((*(_BYTE *)v17 & 1) == 0)
        goto LABEL_47;
      v18 = *(NSObject **)(v17 + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_DWORD *)buf = 134217984;
      v98 = v16;
      v19 = "UIFeedbackParameterType (%ld) has no equivalent CHHapticEventParameterID";
      goto LABEL_22;
    case 7:
      getCHHapticEventParameterIDHapticIntensity();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v20)
        goto LABEL_47;
LABEL_28:
      v22 = v20;
      v23 = v7;
      getCHHapticEventTypeHapticTransient();
      v24 = objc_claimAutoreleasedReturnValue();
      if ((id)v24 == v23)
      {

        goto LABEL_42;
      }
      v25 = (void *)v24;
      getCHHapticEventTypeHapticTransient();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v23, "isEqualToString:", v26);

      if (v27)
      {
LABEL_42:
        getCHHapticEventParameterIDHapticIntensity();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v48 == v22)
          goto LABEL_92;
        v50 = (void *)v48;
        getCHHapticEventParameterIDHapticIntensity();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
          goto LABEL_91;
        getCHHapticEventParameterIDHapticSharpness();
        v52 = objc_claimAutoreleasedReturnValue();
        if ((id)v52 == v22)
          goto LABEL_89;
        v53 = (void *)v52;
        getCHHapticEventParameterIDHapticSharpness();
        v54 = objc_claimAutoreleasedReturnValue();
LABEL_63:
        v61 = (void *)v54;
        v62 = objc_msgSend(v22, "isEqualToString:", v54);
        goto LABEL_64;
      }
      getCHHapticEventTypeAudioClick();
      v28 = objc_claimAutoreleasedReturnValue();
      if ((id)v28 == v23)
      {

        goto LABEL_54;
      }
      v29 = (void *)v28;
      getCHHapticEventTypeAudioClick();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v23, "isEqualToString:", v30);

      if (v31)
      {
LABEL_54:
        getCHHapticEventParameterIDAudioVolume();
        v57 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v57 == v22)
          goto LABEL_92;
        v50 = (void *)v57;
        getCHHapticEventParameterIDAudioVolume();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
          goto LABEL_91;
        getCHHapticEventParameterIDAudioPitch();
        v58 = objc_claimAutoreleasedReturnValue();
        if ((id)v58 == v22)
          goto LABEL_89;
        v53 = (void *)v58;
        getCHHapticEventParameterIDAudioPitch();
        v54 = objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      getCHHapticEventTypeWheelsOfTime();
      v32 = objc_claimAutoreleasedReturnValue();
      if ((id)v32 == v23)
      {

        goto LABEL_59;
      }
      v33 = (void *)v32;
      getCHHapticEventTypeWheelsOfTime();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v23, "isEqualToString:", v34);

      if (v35)
      {
LABEL_59:
        getCHHapticEventParameterIDHapticIntensity();
        v59 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v59 == v22)
          goto LABEL_92;
        v50 = (void *)v59;
        getCHHapticEventParameterIDHapticIntensity();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
          goto LABEL_91;
        getCHHapticEventParameterIDAudioVolume();
        v60 = objc_claimAutoreleasedReturnValue();
        if ((id)v60 == v22)
          goto LABEL_89;
        v53 = (void *)v60;
        getCHHapticEventParameterIDAudioVolume();
        v54 = objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      getCHHapticEventTypeAudioCustom();
      v36 = objc_claimAutoreleasedReturnValue();
      if ((id)v36 == v23)
      {

LABEL_67:
        getCHHapticEventParameterIDAudioVolume();
        v63 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v63 == v22)
          goto LABEL_92;
        v50 = (void *)v63;
        getCHHapticEventParameterIDAudioVolume();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
          goto LABEL_91;
        getCHHapticEventParameterIDAudioPan();
        v64 = objc_claimAutoreleasedReturnValue();
        if ((id)v64 == v22)
          goto LABEL_89;
        v53 = (void *)v64;
        getCHHapticEventParameterIDAudioPan();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v61) & 1) == 0)
        {
          getCHHapticEventParameterIDAudioBrightness();
          v65 = (id)objc_claimAutoreleasedReturnValue();
          if (v65 != v22)
          {
            v95 = v65;
            getCHHapticEventParameterIDAudioBrightness();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "isEqualToString:") & 1) == 0)
            {
              getCHHapticEventParameterIDAudioPitch();
              v66 = (id)objc_claimAutoreleasedReturnValue();
              if (v66 == v22)
              {
                v62 = 1;
              }
              else
              {
                v90 = v66;
                getCHHapticEventParameterIDAudioPitch();
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                v62 = objc_msgSend(v22, "isEqualToString:", v87);

                v66 = v90;
              }

              goto LABEL_127;
            }
LABEL_82:
            v62 = 1;
LABEL_127:

            v65 = v95;
            goto LABEL_128;
          }
LABEL_95:
          v62 = 1;
LABEL_128:

          goto LABEL_64;
        }
LABEL_88:

LABEL_90:
        goto LABEL_91;
      }
      v37 = (void *)v36;
      getCHHapticEventTypeAudioCustom();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v23, "isEqualToString:", v38);

      if (v39)
        goto LABEL_67;
      getCHHapticEventTypeHapticContinuous();
      v40 = objc_claimAutoreleasedReturnValue();
      if ((id)v40 == v23)
      {

LABEL_76:
        getCHHapticEventParameterIDHapticIntensity();
        v67 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v67 == v22)
          goto LABEL_92;
        v50 = (void *)v67;
        getCHHapticEventParameterIDHapticIntensity();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) != 0)
          goto LABEL_91;
        getCHHapticEventParameterIDHapticSharpness();
        v68 = objc_claimAutoreleasedReturnValue();
        if ((id)v68 == v22)
          goto LABEL_89;
        v53 = (void *)v68;
        getCHHapticEventParameterIDHapticSharpness();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v22, "isEqualToString:", v61) & 1) == 0)
        {
          getCHHapticEventParameterIDAttackTime();
          v65 = (id)objc_claimAutoreleasedReturnValue();
          if (v65 != v22)
          {
            v95 = v65;
            getCHHapticEventParameterIDAttackTime();
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v22, "isEqualToString:") & 1) == 0)
            {
              getCHHapticEventParameterIDDecayTime();
              v91 = (id)objc_claimAutoreleasedReturnValue();
              if (v91 == v22)
              {
                v62 = 1;
              }
              else
              {
                getCHHapticEventParameterIDDecayTime();
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                {
                  v62 = 1;
                }
                else
                {
                  getCHHapticEventParameterIDReleaseTime();
                  v85 = (id)objc_claimAutoreleasedReturnValue();
                  if (v85 == v22)
                  {
                    v62 = 1;
                  }
                  else
                  {
                    getCHHapticEventParameterIDReleaseTime();
                    v83 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                    {
                      v62 = 1;
                    }
                    else
                    {
                      getCHHapticEventParameterIDSustained();
                      v81 = (id)objc_claimAutoreleasedReturnValue();
                      if (v81 == v22)
                      {
                        v62 = 1;
                      }
                      else
                      {
                        getCHHapticEventParameterIDSustained();
                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                        v62 = objc_msgSend(v22, "isEqualToString:", v79);

                      }
                    }

                  }
                }

              }
              goto LABEL_127;
            }
            goto LABEL_82;
          }
          goto LABEL_95;
        }
        goto LABEL_88;
      }
      v41 = (void *)v40;
      getCHHapticEventTypeHapticContinuous();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v23, "isEqualToString:", v42);

      if (v43)
        goto LABEL_76;
      getCHHapticEventTypeAudioContinuous();
      v44 = objc_claimAutoreleasedReturnValue();
      if ((id)v44 == v23)
      {

LABEL_84:
        getCHHapticEventParameterIDAudioVolume();
        v69 = objc_claimAutoreleasedReturnValue();
        v49 = v22;
        if ((id)v69 != v22)
        {
          v50 = (void *)v69;
          getCHHapticEventParameterIDAudioVolume();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v22, "isEqualToString:", v51) & 1) == 0)
          {
            getCHHapticEventParameterIDAudioPan();
            v70 = objc_claimAutoreleasedReturnValue();
            if ((id)v70 != v22)
            {
              v53 = (void *)v70;
              getCHHapticEventParameterIDAudioPan();
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v22, "isEqualToString:", v61) & 1) != 0)
                goto LABEL_88;
              getCHHapticEventParameterIDAudioBrightness();
              v96 = (id)objc_claimAutoreleasedReturnValue();
              if (v96 == v22)
              {
                v62 = 1;
              }
              else
              {
                getCHHapticEventParameterIDAudioBrightness();
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                {
                  v62 = 1;
                }
                else
                {
                  getCHHapticEventParameterIDAudioPitch();
                  v92 = (id)objc_claimAutoreleasedReturnValue();
                  if (v92 == v22)
                  {
                    v62 = 1;
                  }
                  else
                  {
                    getCHHapticEventParameterIDAudioPitch();
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                    {
                      v62 = 1;
                    }
                    else
                    {
                      getCHHapticEventParameterIDAttackTime();
                      v86 = (id)objc_claimAutoreleasedReturnValue();
                      if (v86 == v22)
                      {
                        v62 = 1;
                      }
                      else
                      {
                        getCHHapticEventParameterIDAttackTime();
                        v84 = (void *)objc_claimAutoreleasedReturnValue();
                        if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                        {
                          v62 = 1;
                        }
                        else
                        {
                          getCHHapticEventParameterIDDecayTime();
                          v82 = (id)objc_claimAutoreleasedReturnValue();
                          if (v82 == v22)
                          {
                            v62 = 1;
                          }
                          else
                          {
                            getCHHapticEventParameterIDDecayTime();
                            v80 = (void *)objc_claimAutoreleasedReturnValue();
                            if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                            {
                              v62 = 1;
                            }
                            else
                            {
                              getCHHapticEventParameterIDReleaseTime();
                              v78 = (id)objc_claimAutoreleasedReturnValue();
                              if (v78 == v22)
                              {
                                v62 = 1;
                              }
                              else
                              {
                                getCHHapticEventParameterIDReleaseTime();
                                v77 = (void *)objc_claimAutoreleasedReturnValue();
                                if ((objc_msgSend(v22, "isEqualToString:") & 1) != 0)
                                {
                                  v62 = 1;
                                }
                                else
                                {
                                  getCHHapticEventParameterIDSustained();
                                  v76 = (id)objc_claimAutoreleasedReturnValue();
                                  if (v76 == v22)
                                  {
                                    v62 = 1;
                                  }
                                  else
                                  {
                                    getCHHapticEventParameterIDSustained();
                                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                                    v62 = objc_msgSend(v22, "isEqualToString:", v75);

                                  }
                                }

                              }
                            }

                          }
                        }

                      }
                    }

                  }
                }

              }
LABEL_64:

              if ((v62 & 1) == 0)
                goto LABEL_48;
LABEL_93:
              v71 = objc_alloc((Class)getCHHapticEventParameterClass());
              *(float *)&v72 = v13;
              v56 = (void *)objc_msgSend(v71, "initWithParameterID:value:", v22, v72);
              goto LABEL_94;
            }
LABEL_89:
            v53 = v22;
            goto LABEL_90;
          }
LABEL_91:

          v49 = v50;
        }
LABEL_92:

        goto LABEL_93;
      }
      v45 = (void *)v44;
      getCHHapticEventTypeAudioContinuous();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v23, "isEqualToString:", v46);

      if ((v47 & 1) != 0)
        goto LABEL_84;

LABEL_48:
      if (!_UIFeedbackLoggingDisabled)
      {
        v55 = qword_1ECD7AA68;
        if (!qword_1ECD7AA68)
        {
          v55 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v55, (unint64_t *)&qword_1ECD7AA68);
        }
        if ((*(_BYTE *)v55 & 1) != 0)
        {
          v74 = *(NSObject **)(v55 + 8);
          if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v98 = v16;
            v99 = 2048;
            v100 = v13;
            _os_log_impl(&dword_185066000, v74, OS_LOG_TYPE_ERROR, "Ignoring UIFeedbackParameterType (%ld) with value %f", buf, 0x16u);
          }
        }
      }
      v56 = 0;
LABEL_94:

      return v56;
    default:
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_47;
      v21 = qword_1ECD7AAD0;
      if (!qword_1ECD7AAD0)
      {
        v21 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v21, (unint64_t *)&qword_1ECD7AAD0);
      }
      v18 = *(NSObject **)(v21 + 8);
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_DWORD *)buf = 134217984;
      v98 = v16;
      v19 = "Cannot convert UIFeedbackParameterType (%ld) to CHHapticEventParameterID";
LABEL_22:
      _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
LABEL_47:
      v22 = 0;
      goto LABEL_48;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHapticsPlayer, 0);
  objc_destroyWeak((id *)&self->_hapticEngine);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (_UIFeedbackCoreHapticsPlayer)initWithEngine:(id)a3
{
  id v4;
  _UIFeedbackCoreHapticsPlayer *v5;
  _UIFeedbackCoreHapticsPlayer *v6;
  uint64_t v7;
  OS_dispatch_queue *internalQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIFeedbackCoreHapticsPlayer;
  v5 = -[_UIFeedbackCoreHapticsPlayer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_hapticEngine, v4);
    objc_msgSend((id)objc_opt_class(), "_internalQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v7;

  }
  return v6;
}

- (id)_internal_createPlayerWithPattern:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coreHapticsEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v22 = 0;
    objc_msgSend(v6, "createPrivilegedPlayerWithPlayable:error:", v4, &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;
    v9 = v8;
    if (!v7 || v8)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v16 = qword_1ECD7AA28;
        if (!qword_1ECD7AA28)
        {
          v16 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v16, (unint64_t *)&qword_1ECD7AA28);
        }
        v17 = *(NSObject **)(v16 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = v17;
          -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v19), v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v20;
          v25 = 2112;
          v26 = v9;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "failed to create player with pattern for %@: %@", buf, 0x16u);

        }
      }
      v10 = 0;
    }
    else
    {
      v10 = v7;
    }

  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v11 = qword_1ECD7AA20;
      if (!qword_1ECD7AA20)
      {
        v11 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&qword_1ECD7AA20);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = v12;
        -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v14), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v15;
        _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "failed to create player with pattern because CHHapticEngine was nil for %@", buf, 0xCu);

      }
    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "canReuseCoreHapticsPlayer"))
        {

          goto LABEL_12;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v12)
        continue;
      break;
    }
  }

  -[_UIFeedbackCoreHapticsPlayer coreHapticsPlayer](self, "coreHapticsPlayer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    goto LABEL_15;
LABEL_12:
  -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "coreHapticsEngine");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFeedbackCoreHapticsPlayer _internal_createPatternForFeedbackData:feedback:engine:](self, "_internal_createPatternForFeedbackData:feedback:engine:", v10, v9, v17);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_UIFeedbackCoreHapticsPlayer _internal_createPlayerWithPattern:](self, "_internal_createPlayerWithPattern:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_23:

      goto LABEL_24;
    }
    -[_UIFeedbackCoreHapticsPlayer setCoreHapticsPlayer:](self, "setCoreHapticsPlayer:", v19);

LABEL_15:
    -[_UIFeedbackCoreHapticsPlayer coreHapticsPlayer](self, "coreHapticsPlayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v19, "startAtTime:error:", &v27, a5);
    v18 = v27;

    LOBYTE(v19) = v18 == 0;
    if (v18)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        v20 = _internal_playFeedbackData_forFeedback_atTime____s_category;
        if (!_internal_playFeedbackData_forFeedback_atTime____s_category)
        {
          v20 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v20, (unint64_t *)&_internal_playFeedbackData_forFeedback_atTime____s_category);
        }
        v21 = *(NSObject **)(v20 + 8);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = v21;
          -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v23), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v24;
          v34 = 2112;
          v35 = v18;
          _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "failed playing feedback event for %@: %@", buf, 0x16u);

        }
      }
    }
    else
    {
      -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_internal_willPlayFeedback:atTime:", v9, a5);

      kdebug_trace();
    }
    goto LABEL_23;
  }
  LOBYTE(v19) = 0;
LABEL_24:

  return (char)v19;
}

- (_UIFeedbackCoreHapticsEngine)hapticEngine
{
  return (_UIFeedbackCoreHapticsEngine *)objc_loadWeakRetained((id *)&self->_hapticEngine);
}

- (void)setCoreHapticsPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_coreHapticsPlayer, a3);
}

- (CHHapticPatternPlayer)coreHapticsPlayer
{
  return self->_coreHapticsPlayer;
}

- (id)_internal_createPatternForFeedbackData:(id)a3 feedback:(id)a4 engine:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _UIFeedbackCoreHapticsPlayer *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  id v28;
  objc_class *CHHapticPatternClass;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  id *v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  id v41;
  NSObject *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  __CFString *v46;
  BOOL v47;
  unint64_t v48;
  NSObject *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  id v53;
  NSObject *v54;
  void *v55;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  id obj;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  const __CFString *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v57 = a4;
  v60 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v68;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    v14 = (void *)MEMORY[0x1E0C9AA60];
    v59 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v68 != v12)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "effectiveEnabledFeedbackTypes");
        if ((v17 & 3) == 3)
          goto LABEL_9;
        v18 = v17;
        if ((v17 & 3) != 2)
          goto LABEL_12;
        -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
        v62 = v13;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "coreHapticsEngine");
        v20 = v10;
        v21 = self;
        v22 = v14;
        v23 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "playsHapticsOnly");

        v11 = v23;
        v14 = v22;
        self = v21;
        v10 = v20;

        v13 = v62;
        v12 = v59;
        if (v25)
        {
LABEL_9:
          v65 = v13;
          v66 = v14;
          -[_UIFeedbackCoreHapticsPlayer _internal_createEventsForFeedbackData:engine:parameters:parameterCurves:](self, "_internal_createEventsForFeedbackData:engine:parameters:parameterCurves:", v16, v60, &v66, &v65);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v66;

          v28 = v65;
          if (v26)
            objc_msgSend(v58, "addObjectsFromArray:", v26);

          v13 = v28;
          v14 = v27;
        }
        else
        {
LABEL_12:
          if (!v11)
            v11 = (__CFString *)objc_opt_new();
          -[__CFString appendFormat:](v11, "appendFormat:", CFSTR(" %lu"), v18);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  if (objc_msgSend(v58, "count"))
  {
    CHHapticPatternClass = (objc_class *)qword_1ECD7A988;
    v30 = v57;
    if (!qword_1ECD7A988)
      CHHapticPatternClass = (objc_class *)getCHHapticPatternClass();
    v31 = v13;
    v32 = objc_msgSend(v13, "count");
    v33 = [CHHapticPatternClass alloc];
    if (v32)
    {
      v64 = 0;
      v34 = (id *)&v64;
      v35 = objc_msgSend(v33, "initWithEvents:parameterCurves:error:", v58, v31, &v64);
    }
    else
    {
      v63 = 0;
      v34 = (id *)&v63;
      v35 = objc_msgSend(v33, "initWithEvents:parameters:error:", v58, v14, &v63);
    }
    v45 = (void *)v35;
    v13 = v31;
    v46 = (__CFString *)*v34;
    if (v46)
      v47 = 1;
    else
      v47 = v45 == 0;
    if (v47 && !_UIFeedbackLoggingDisabled)
    {
      v48 = qword_1ECD7AA60;
      if (!qword_1ECD7AA60)
      {
        v48 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v48, (unint64_t *)&qword_1ECD7AA60);
      }
      v49 = *(NSObject **)(v48 + 8);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = v31;
        v51 = (void *)MEMORY[0x1E0CB3940];
        v52 = v11;
        v53 = v57;
        v54 = v49;
        objc_msgSend(v51, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v53), v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = v52;
        *(_DWORD *)buf = 138412546;
        v72 = v55;
        v73 = 2112;
        v74 = v46;
        _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_ERROR, "failed to create haptic pattern for feedback %@: %@", buf, 0x16u);

        v13 = v50;
      }
    }

  }
  else
  {
    v30 = v57;
    if (!_UIFeedbackLoggingDisabled)
    {
      v36 = qword_1ECD7AA58;
      if (!qword_1ECD7AA58)
      {
        v36 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v36, (unint64_t *)&qword_1ECD7AA58);
      }
      v37 = *(NSObject **)(v36 + 8);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = v13;
        v39 = (void *)MEMORY[0x1E0CB3940];
        v40 = v11;
        v41 = v57;
        v42 = v37;
        objc_msgSend(v39, "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v41), v41);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = (__CFString *)v40;
        v44 = CFSTR(" none");
        if (v40)
          v44 = v40;
        *(_DWORD *)buf = 138412546;
        v72 = v43;
        v73 = 2112;
        v74 = v44;
        _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_DEFAULT, "no playable feedback for %@ (ignored feedback types:%@)", buf, 0x16u);

        v13 = v38;
      }
    }
    v45 = 0;
  }

  return v45;
}

- (id)_internal_createEventsForFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "pattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIFeedbackCoreHapticsPlayer _internal_createEventsForLibraryFeedbackData:engine:parameters:parameterCurves:](self, "_internal_createEventsForLibraryFeedbackData:engine:parameters:parameterCurves:", v10, v11, a5, a6);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "fileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UIFeedbackCoreHapticsPlayer _internal_createEventsForFileFeedbackData:engine:parameters:parameterCurves:](self, "_internal_createEventsForFileFeedbackData:engine:parameters:parameterCurves:", v10, v11, a5, a6);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v10, "isTransientHaptic"))
        -[_UIFeedbackCoreHapticsPlayer _internal_createEventsForTransientHapticData:](self, "_internal_createEventsForTransientHapticData:", v10);
      else
        -[_UIFeedbackCoreHapticsPlayer _internal_createEventsForLegacyFeedbackData:](self, "_internal_createEventsForLegacyFeedbackData:", v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
  }
  v15 = (void *)v13;

  return v15;
}

- (id)_internal_createEventsForLegacyFeedbackData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  float v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  void **v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  _UIFeedbackCoreHapticsPlayer *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "effectiveEventType");
  _coreHapticsEventTypeForEffectiveEventType(v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFeedbackParameters parameters](_UIFeedbackParameters, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __76___UIFeedbackCoreHapticsPlayer__internal_createEventsForLegacyFeedbackData___block_invoke;
    v40 = &unk_1E16C5C78;
    v41 = self;
    v9 = v4;
    v42 = v9;
    v10 = v6;
    v43 = v10;
    v11 = v7;
    v44 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v37);

    v12 = v11;
    if (v5 <= 17236)
    {
      if (v5 > 14164)
      {
        if (v5 > 15968)
        {
          if (v5 > 16480)
          {
            if (v5 == 16481)
            {
              v15 = 0.5;
              goto LABEL_19;
            }
            if (v5 == 16737)
            {
              v15 = 1.0;
              goto LABEL_19;
            }
          }
          else
          {
            if (v5 == 15969)
            {
              v15 = -0.5;
              goto LABEL_19;
            }
            if (v5 == 16225)
            {
              v15 = 0.0;
              goto LABEL_19;
            }
          }
        }
        else
        {
          if ((unint64_t)(v5 - 14165) < 3)
            goto LABEL_18;
          v15 = -1.0;
          if (v5 == 15713)
          {
LABEL_19:
            v16 = objc_alloc((Class)getCHHapticEventParameterClass());
            getCHHapticEventParameterIDHapticSharpness();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v18 = v15;
            v19 = (void *)objc_msgSend(v16, "initWithParameterID:value:", v17, v18, v37, v38, v39, v40, v41, v42, v43);
            objc_msgSend(v12, "addObject:", v19);

          }
        }
LABEL_20:

        getCHHapticEventTypeAudioCustom();
        v20 = objc_claimAutoreleasedReturnValue();
        if (v10 == (id)v20)
        {

        }
        else
        {
          v21 = (void *)v20;
          getCHHapticEventTypeAudioCustom();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v10, "isEqualToString:", v22);

          if (!v23)
          {
            getCHHapticEventTypeHapticContinuous();
            v24 = objc_claimAutoreleasedReturnValue();
            if (v10 == (id)v24)
            {

            }
            else
            {
              v25 = (void *)v24;
              getCHHapticEventTypeHapticContinuous();
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v10, "isEqualToString:", v26);

              if (!v27)
              {
                v28 = objc_alloc((Class)getCHHapticEventClass());
                objc_msgSend(v9, "effectiveDelay");
                v29 = (void *)objc_msgSend(v28, "initWithEventType:parameters:relativeTime:", v10, v12);
                v45 = v29;
                v30 = &v45;
LABEL_33:
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1, v37, v38, v39, v40, v41);
                v14 = (void *)objc_claimAutoreleasedReturnValue();

                goto LABEL_34;
              }
            }
            v32 = objc_alloc((Class)getCHHapticEventClass());
            objc_msgSend(v9, "effectiveDelay");
            v34 = v33;
            objc_msgSend(v9, "effectiveDuration");
            v29 = (void *)objc_msgSend(v32, "initWithEventType:parameters:relativeTime:duration:", v10, v12, v34, v35);
            v46 = v29;
            v30 = &v46;
            goto LABEL_33;
          }
        }
        v31 = objc_alloc((Class)getCHHapticEventClass());
        objc_msgSend(v9, "effectiveDelay");
        v29 = (void *)objc_msgSend(v31, "initWithAudioResourceID:parameters:relativeTime:", v5, v12);
        v47[0] = v29;
        v30 = (void **)v47;
        goto LABEL_33;
      }
      if ((unint64_t)(v5 - 8021) < 3)
        goto LABEL_18;
      v13 = -11093;
    }
    else
    {
      if (v5 > 23380)
      {
        if ((unint64_t)(v5 - 23381) >= 3 && (unint64_t)(v5 - 26453) >= 3)
        {
          v13 = -29525;
          goto LABEL_17;
        }
LABEL_18:
        v15 = (float)(8 * v5 + (unint64_t)((BYTE1(v5) - 31) / 0xCu) - 680)
            * 0.043478;
        goto LABEL_19;
      }
      if ((unint64_t)(v5 - 17237) < 3)
        goto LABEL_18;
      v13 = -20309;
    }
LABEL_17:
    if ((unint64_t)(v5 + v13) >= 3)
      goto LABEL_20;
    goto LABEL_18;
  }
  v14 = 0;
LABEL_34:

  return v14;
}

- (id)_internal_createEventsForLibraryFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(v8, "pattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _internal_populateParamtersFromPattern(v9, a5, a6);

  objc_msgSend(v8, "pattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "events");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_internal_createEventsForFileFeedbackData:(id)a3 engine:(id)a4 parameters:(id *)a5 parameterCurves:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  _BYTE buf[24];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v46 = a4;
  if (qword_1ECD7AA38 != -1)
    dispatch_once(&qword_1ECD7AA38, &__block_literal_global_89_0);
  objc_msgSend(v10, "fileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECD7AA30, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "fileFeedbackType") == 2)
  {
    v13 = v12;
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v14, 0, &v52);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v52;
      objc_msgSend((id)qword_1ECD7AA30, "setObject:forKeyedSubscript:", v13, v11);
      if (v15 && !_UIFeedbackLoggingDisabled)
      {
        v16 = qword_1ECD7AA40;
        if (!qword_1ECD7AA40)
        {
          v16 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v16, (unint64_t *)&qword_1ECD7AA40);
        }
        v17 = *(NSObject **)(v16 + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = v17;
          objc_msgSend(v11, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v19;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v15;
          _os_log_impl(&dword_185066000, v18, OS_LOG_TYPE_ERROR, "failed loading haptic file %@: %@", buf, 0x16u);

        }
      }

    }
    v51 = 0;
    v20 = (void *)objc_msgSend(objc_alloc((Class)getCHHapticPatternClass()), "initWithDictionary:error:", v13, &v51);
    v21 = v51;
    if (v21 && !_UIFeedbackLoggingDisabled)
    {
      v22 = qword_1ECD7AA48;
      if (!qword_1ECD7AA48)
      {
        v22 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&qword_1ECD7AA48);
      }
      v23 = *(NSObject **)(v22 + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v21;
        _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "failed loading haptic file dictionary: %@", buf, 0xCu);
      }
    }
    _internal_populateParamtersFromPattern(v20, a5, a6);
    objc_msgSend(v20, "events");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
    goto LABEL_39;
  }
  if (objc_msgSend(v10, "fileFeedbackType") == 1)
  {
    v25 = v12;
    v26 = objc_msgSend(v25, "unsignedIntegerValue");
    if (v25 && (v27 = v26, (objc_msgSend(v46, "resourceIsRegistered:", v26) & 1) != 0))
    {
      v13 = v25;
    }
    else
    {
      if (objc_msgSend(v10, "disableEventUseVolumeEnvelope"))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v28 = (id *)qword_1ECD7AAC0;
        v57 = qword_1ECD7AAC0;
        if (!qword_1ECD7AAC0)
        {
          v29 = CoreHapticsLibrary_1();
          v28 = (id *)dlsym(v29, "CHHapticAudioResourceKeyUseVolumeEnvelope");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v28;
          qword_1ECD7AAC0 = (uint64_t)v28;
        }
        _Block_object_dispose(buf, 8);
        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticAudioResourceKey getCHHapticAudioResourceKeyUseVolumeEnvelope(void)");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v45, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 80, CFSTR("%s"), dlerror());

          __break(1u);
        }
        v54 = *v28;
        v55 = MEMORY[0x1E0C9AAA0];
        v30 = (void *)MEMORY[0x1E0C99D80];
        v31 = v54;
        objc_msgSend(v30, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = (void *)MEMORY[0x1E0C9AA70];
      }
      v50 = 0;
      v27 = objc_msgSend(v46, "registerAudioResource:options:error:", v11, v32, &v50);
      v33 = v50;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)qword_1ECD7AA30, "setObject:forKeyedSubscript:", v13, v11);
      if (v33 && !_UIFeedbackLoggingDisabled)
      {
        v34 = qword_1ECD7AA50;
        if (!qword_1ECD7AA50)
        {
          v34 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v34, (unint64_t *)&qword_1ECD7AA50);
        }
        v35 = *(NSObject **)(v34 + 8);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = v35;
          objc_msgSend(v11, "lastPathComponent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v33;
          _os_log_impl(&dword_185066000, v36, OS_LOG_TYPE_ERROR, "failed registering audio file %@: %@", buf, 0x16u);

        }
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIFeedbackParameters parameters](_UIFeedbackParameters, "parameters");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __108___UIFeedbackCoreHapticsPlayer__internal_createEventsForFileFeedbackData_engine_parameters_parameterCurves___block_invoke_98;
    v47[3] = &unk_1E16C5C50;
    v47[4] = self;
    v40 = v10;
    v48 = v40;
    v49 = v38;
    v21 = v38;
    objc_msgSend(v39, "enumerateKeysAndObjectsUsingBlock:", v47);

    v41 = objc_alloc((Class)getCHHapticEventClass());
    objc_msgSend(v40, "effectiveDelay");
    v42 = (void *)objc_msgSend(v41, "initWithAudioResourceID:parameters:relativeTime:", v27, v21);
    v53 = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
  v24 = 0;
LABEL_39:

  return v24;
}

- (id)_internal_createEventsForTransientHapticData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc((Class)getCHHapticEventParameterClass());
  getCHHapticEventParameterIDHapticIntensity();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intensity");
  v6 = (void *)objc_msgSend(v4, "initWithParameterID:value:", v5);

  v7 = objc_alloc((Class)getCHHapticEventParameterClass());
  getCHHapticEventParameterIDHapticSharpness();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharpness");
  v9 = (void *)objc_msgSend(v7, "initWithParameterID:value:", v8);

  v10 = objc_alloc((Class)getCHHapticEventClass());
  getCHHapticEventTypeHapticTransient();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveDelay");
  v14 = v13;

  v15 = (void *)objc_msgSend(v10, "initWithEventType:parameters:relativeTime:", v11, v12, v14);
  v19[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_updateValueForParameters:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *internalQueue;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66___UIFeedbackCoreHapticsPlayer__updateValueForParameters_withKey___block_invoke;
  block[3] = &unk_1E16B47A8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = internalQueue;
  if (!v9)
  {
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
  }
  v11 = v7;
  v12 = v6;
  dispatch_async(v9, block);

}

- (void)_internal_updateValueForParameters:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  float v10;
  float v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  const char *v17;
  unint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  objc_class *v54;
  id v55;
  double v56;
  void *v57;
  void *v58;
  unint64_t v59;
  void *v60;
  double v61;
  unint64_t v62;
  NSObject *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  int v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _BYTE buf[24];
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[2];

  v83[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[_UIFeedbackParameters parameters](_UIFeedbackParameters, "parameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_effectiveValueForParameterWithKey:", v7);
  v11 = v10;
  if (objc_msgSend(v6, "_isAudio"))
    v12 = CFSTR("audioType");
  else
    v12 = CFSTR("hapticType");
  objc_msgSend(v9, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (int)objc_msgSend(v13, "intValue");

  switch(v14)
  {
    case 0:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AAE8;
      v81 = qword_1ECD7AAE8;
      if (!qword_1ECD7AAE8)
      {
        v20 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v20, "CHHapticDynamicParameterIDAudioVolumeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AAE8 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioVolumeControl(void)");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 70, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 1:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AAF0;
      v81 = qword_1ECD7AAF0;
      if (!qword_1ECD7AAF0)
      {
        v23 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v23, "CHHapticDynamicParameterIDAudioPitchControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AAF0 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioPitchControl(void)");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 73, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 2:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB00;
      v81 = qword_1ECD7AB00;
      if (!qword_1ECD7AB00)
      {
        v26 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v26, "CHHapticDynamicParameterIDAudioAttackTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB00 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioAttackTimeControl(void)");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 74, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 3:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB08;
      v81 = qword_1ECD7AB08;
      if (!qword_1ECD7AB08)
      {
        v29 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v29, "CHHapticDynamicParameterIDAudioDecayTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB08 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioDecayTimeControl(void)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 75, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 4:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB10;
      v81 = qword_1ECD7AB10;
      if (!qword_1ECD7AB10)
      {
        v32 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v32, "CHHapticDynamicParameterIDAudioReleaseTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB10 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioReleaseTimeControl(void)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 76, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 5:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AAF8;
      v81 = qword_1ECD7AAF8;
      if (!qword_1ECD7AAF8)
      {
        v35 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v35, "CHHapticDynamicParameterIDAudioPanControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AAF8 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDAudioPanControl(void)");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 71, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 6:
    case 12:
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_74;
      v15 = qword_1ECD7AAD8;
      if (!qword_1ECD7AAD8)
      {
        v15 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&qword_1ECD7AAD8);
      }
      if ((*(_BYTE *)v15 & 1) == 0)
        goto LABEL_74;
      v16 = *(NSObject **)(v15 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v14;
      v17 = "UIFeedbackParameterType (%ld) has no equivalent CHHapticDynamicParameterID";
      goto LABEL_16;
    case 7:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB18;
      v81 = qword_1ECD7AB18;
      if (!qword_1ECD7AB18)
      {
        v50 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v50, "CHHapticDynamicParameterIDHapticIntensityControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB18 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticIntensityControl(void)");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 64, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 8:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB38;
      v81 = qword_1ECD7AB38;
      if (!qword_1ECD7AB38)
      {
        v38 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v38, "CHHapticDynamicParameterIDHapticSharpnessControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB38 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticSharpnessControl(void)");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 65, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 9:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB20;
      v81 = qword_1ECD7AB20;
      if (!qword_1ECD7AB20)
      {
        v41 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v41, "CHHapticDynamicParameterIDHapticAttackTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB20 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticAttackTimeControl(void)");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 66, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 10:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB28;
      v81 = qword_1ECD7AB28;
      if (!qword_1ECD7AB28)
      {
        v44 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v44, "CHHapticDynamicParameterIDHapticDecayTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB28 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (v19)
        goto LABEL_60;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticDecayTimeControl(void)");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 67, CFSTR("%s"), dlerror());

      goto LABEL_86;
    case 11:
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v19 = (id *)qword_1ECD7AB30;
      v81 = qword_1ECD7AB30;
      if (!qword_1ECD7AB30)
      {
        v47 = CoreHapticsLibrary_1();
        v19 = (id *)dlsym(v47, "CHHapticDynamicParameterIDHapticReleaseTimeControl");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
        qword_1ECD7AB30 = (uint64_t)v19;
      }
      _Block_object_dispose(buf, 8);
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CHHapticDynamicParameterID getCHHapticDynamicParameterIDHapticReleaseTimeControl(void)");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("_UIFeedbackCoreHapticsEngineUtilities.h"), 68, CFSTR("%s"), dlerror());

LABEL_86:
        __break(1u);
      }
LABEL_60:
      v51 = *v19;
      if (!v51)
        goto LABEL_74;
      v52 = v51;
      v76 = 0;
      v77 = &v76;
      v78 = 0x2050000000;
      v53 = (void *)qword_1ECD7AB40;
      v79 = qword_1ECD7AB40;
      if (!qword_1ECD7AB40)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getCHHapticDynamicParameterClass_block_invoke;
        *(double *)&v81 = COERCE_DOUBLE(&unk_1E16B14C0);
        v82[0] = &v76;
        __getCHHapticDynamicParameterClass_block_invoke((uint64_t)buf);
        v53 = (void *)v77[3];
      }
      v54 = objc_retainAutorelease(v53);
      _Block_object_dispose(&v76, 8);
      v55 = [v54 alloc];
      *(float *)&v56 = v11;
      v57 = (void *)objc_msgSend(v55, "initWithParameterID:value:relativeTime:", v52, v56, 0.0);
      v83[0] = v57;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      if (!_UIFeedbackLoggingDisabled)
      {
        v59 = qword_1ECD7AA78;
        if (!qword_1ECD7AA78)
        {
          v59 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v59, (unint64_t *)&qword_1ECD7AA78);
        }
        if ((*(_BYTE *)v59 & 1) != 0)
        {
          v69 = *(NSObject **)(v59 + 8);
          if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          {
            v70 = v69;
            v71 = objc_msgSend(v6, "_isAudio");
            v72 = CFSTR("haptic");
            *(_DWORD *)buf = 138413058;
            if (v71)
              v72 = CFSTR("audio");
            *(_QWORD *)&buf[4] = v72;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v7;
            *(_WORD *)&buf[22] = 2048;
            *(double *)&v81 = v11;
            LOWORD(v82[0]) = 2112;
            *(_QWORD *)((char *)v82 + 2) = self;
            _os_log_impl(&dword_185066000, v70, OS_LOG_TYPE_ERROR, "set %@ %@ %.3f on player %@", buf, 0x2Au);

          }
        }
      }
      -[_UIFeedbackCoreHapticsPlayer coreHapticsPlayer](self, "coreHapticsPlayer");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = 0;
      objc_msgSend(v60, "sendParameters:atTime:error:", v58, &v75, 0.0);
      v61 = COERCE_DOUBLE(v75);

      if (v61 != 0.0 && !_UIFeedbackLoggingDisabled)
      {
        v62 = qword_1ECD7AA80;
        if (!qword_1ECD7AA80)
        {
          v62 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v62, (unint64_t *)&qword_1ECD7AA80);
        }
        v63 = *(NSObject **)(v62 + 8);
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = v63;
          -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v65), v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v7;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v66;
          *(_WORD *)&buf[22] = 2112;
          *(double *)&v81 = v61;
          _os_log_impl(&dword_185066000, v64, OS_LOG_TYPE_ERROR, "failed setting %@ parameter for %@: %@", buf, 0x20u);

        }
      }

      break;
    default:
      if (_UIFeedbackLoggingDisabled)
        goto LABEL_74;
      v18 = qword_1ECD7AAE0;
      if (!qword_1ECD7AAE0)
      {
        v18 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&qword_1ECD7AAE0);
      }
      v16 = *(NSObject **)(v18 + 8);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        goto LABEL_74;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v14;
      v17 = "Cannot convert UIFeedbackParameterType (%ld) to CHHapticDynamicParameterID";
LABEL_16:
      _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
LABEL_74:
      if (!_UIFeedbackLoggingDisabled)
      {
        v67 = qword_1ECD7AA70;
        if (!qword_1ECD7AA70)
        {
          v67 = __UILogCategoryGetNode("FeedbackDebug", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v67, (unint64_t *)&qword_1ECD7AA70);
        }
        if ((*(_BYTE *)v67 & 1) != 0)
        {
          v68 = *(NSObject **)(v67 + 8);
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v14;
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = v11;
            _os_log_impl(&dword_185066000, v68, OS_LOG_TYPE_ERROR, "Ignoring UIFeedbackParameterType (%ld) with value %f", buf, 0x16u);
          }
        }
      }
      break;
  }

}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  OS_dispatch_queue *internalQueue;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v6 = a3;
  objc_msgSend(v6, "_effectiveFeedbackData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53___UIFeedbackCoreHapticsPlayer__playFeedback_atTime___block_invoke;
  v13[3] = &unk_1E16C5CA0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = a4;
  v9 = internalQueue;
  if (!v9)
  {
    v9 = MEMORY[0x1E0C80D38];
    v10 = MEMORY[0x1E0C80D38];
  }
  v11 = v6;
  v12 = v7;
  dispatch_async(v9, v13);

}

- (void)_stopFeedback:(id)a3
{
  id v4;
  void *v5;
  OS_dispatch_queue *internalQueue;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "_effectiveFeedbackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46___UIFeedbackCoreHapticsPlayer__stopFeedback___block_invoke;
  block[3] = &unk_1E16B47A8;
  block[4] = self;
  v12 = v5;
  v13 = v4;
  v7 = internalQueue;
  if (!v7)
  {
    v7 = MEMORY[0x1E0C80D38];
    v8 = MEMORY[0x1E0C80D38];
  }
  v9 = v4;
  v10 = v5;
  dispatch_async(v7, block);

}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_internal_willCancelFeedback:", v5);

  -[_UIFeedbackCoreHapticsPlayer coreHapticsPlayer](self, "coreHapticsPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "stopAtTime:error:", &v14, 0.0);
  v8 = v14;

  if (v8 && !_UIFeedbackLoggingDisabled)
  {
    v9 = _internal_stopFeedbackData_forFeedback____s_category;
    if (!_internal_stopFeedbackData_forFeedback____s_category)
    {
      v9 = __UILogCategoryGetNode("Feedback", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_internal_stopFeedbackData_forFeedback____s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      -[_UIFeedbackCoreHapticsPlayer hapticEngine](self, "hapticEngine");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%s: %p>"), object_getClassName(v12), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v5;
      v17 = 2112;
      v18 = v13;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "failed stopping feedback %@ for %@: %@", buf, 0x20u);

    }
  }

}

- (void)setHapticEngine:(id)a3
{
  objc_storeWeak((id *)&self->_hapticEngine, a3);
}

@end
