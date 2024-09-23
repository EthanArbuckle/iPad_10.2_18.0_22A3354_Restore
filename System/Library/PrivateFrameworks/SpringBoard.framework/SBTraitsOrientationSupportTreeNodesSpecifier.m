@implementation SBTraitsOrientationSupportTreeNodesSpecifier

+ (id)findParticipantWithRole:(id)a3 nodeSpecifications:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "participant", (_QWORD)v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "role");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v5);

      if ((v13 & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

+ (id)findParentForParticipant:(id)a3 nodeSpecifications:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "participant", (_QWORD)v13);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v5)
        {
          objc_msgSend(v10, "parentParticipant");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)updateStageTreeNodesSpecifications:(id)a3 stageParticipantsRoles:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  unint64_t supportedOrientations;
  void *v16;
  NSObject *v17;
  void *v19;
  uint8_t buf[16];

  v6 = a3;
  self->_supportedOrientations = 0;
  +[SBTraitsOrientationSupportTreeNodesSpecifier findParticipantWithRole:nodeSpecifications:](SBTraitsOrientationSupportTreeNodesSpecifier, "findParticipantWithRole:nodeSpecifications:", CFSTR("SBTraitsParticipantRolePipelineManager"), v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  while (1)
  {
    v8 = v7;
    +[SBTraitsOrientationSupportTreeNodesSpecifier findParentForParticipant:nodeSpecifications:](SBTraitsOrientationSupportTreeNodesSpecifier, "findParentForParticipant:nodeSpecifications:", v7, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "role");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBTraitsParticipantRoleSwitcherPublisher"));

    objc_msgSend(v7, "role");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("SBTraitsParticipantRoleSwitcherRaw"));

    if ((v10 & 1) == 0 && !v12)
    {
      objc_msgSend(v7, "orientationPreferences");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      self->_supportedOrientations = objc_msgSend(v16, "supportedOrientations");

      break;
    }
    objc_msgSend(v7, "orientationResolutionPolicyInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "resolutionPolicy");

    if (!v14)
    {
      objc_msgSend(v7, "currentOrientation");
      supportedOrientations = SBFBSInterfaceOrientationMaskForBSInterfaceOrientation();
      self->_supportedOrientations = supportedOrientations;
      goto LABEL_9;
    }
  }
  supportedOrientations = self->_supportedOrientations;
LABEL_9:
  if (!supportedOrientations)
  {
    SBLogTraitsArbiter();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[ContinuityPipeline] No valid supported orientation found", buf, 2u);
    }

  }
  return v6;
}

- (unint64_t)supportedOrientations
{
  return self->_supportedOrientations;
}

@end
