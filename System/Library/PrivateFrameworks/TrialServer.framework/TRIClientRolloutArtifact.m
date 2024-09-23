@implementation TRIClientRolloutArtifact

- (TRIClientRolloutArtifact)initWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6
{
  id v12;
  id v13;
  id v14;
  TRIClientRolloutArtifact *v15;
  TRIClientRolloutArtifact *v16;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1703, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("populations != nil"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1702, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rollout != nil"));

  if (!v13)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 1704, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("deploymentDate != nil"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)TRIClientRolloutArtifact;
  v15 = -[TRIClientRolloutArtifact init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rollout, a3);
    objc_storeStrong((id *)&v16->_populations, a4);
    objc_storeStrong((id *)&v16->_deploymentDate, a5);
    v16->_downloadSize = a6;
  }

  return v16;
}

+ (id)artifactWithRollout:(id)a3 populations:(id)a4 deploymentDate:(id)a5 downloadSize:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRollout:populations:deploymentDate:downloadSize:", v12, v11, v10, a6);

  return v13;
}

- (id)copyWithReplacementRollout:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRollout:populations:deploymentDate:downloadSize:", v4, self->_populations, self->_deploymentDate, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementPopulations:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRollout:populations:deploymentDate:downloadSize:", self->_rollout, v4, self->_deploymentDate, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDeploymentDate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRollout:populations:deploymentDate:downloadSize:", self->_rollout, self->_populations, v4, self->_downloadSize);

  return v5;
}

- (id)copyWithReplacementDownloadSize:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRollout:populations:deploymentDate:downloadSize:", self->_rollout, self->_populations, self->_deploymentDate, a3);
}

- (BOOL)isEqualToArtifact:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIClientRollout *rollout;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSArray *populations;
  void *v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSDate *deploymentDate;
  void *v22;
  int v23;
  unint64_t downloadSize;
  BOOL v25;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  v6 = self->_rollout != 0;
  objc_msgSend(v4, "rollout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_12;
  rollout = self->_rollout;
  if (rollout)
  {
    objc_msgSend(v5, "rollout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIClientRollout isEqual:](rollout, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  v12 = self->_populations != 0;
  objc_msgSend(v5, "populations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
    goto LABEL_12;
  populations = self->_populations;
  if (populations)
  {
    objc_msgSend(v5, "populations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSArray isEqual:](populations, "isEqual:", v16);

    if (!v17)
      goto LABEL_12;
  }
  v18 = self->_deploymentDate != 0;
  objc_msgSend(v5, "deploymentDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19 == 0;

  if (v18 == v20
    || (deploymentDate = self->_deploymentDate) != 0
    && (objc_msgSend(v5, "deploymentDate"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = -[NSDate isEqual:](deploymentDate, "isEqual:", v22),
        v22,
        !v23))
  {
LABEL_12:
    v25 = 0;
  }
  else
  {
    downloadSize = self->_downloadSize;
    v25 = downloadSize == objc_msgSend(v5, "downloadSize");
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  TRIClientRolloutArtifact *v4;
  TRIClientRolloutArtifact *v5;
  BOOL v6;

  v4 = (TRIClientRolloutArtifact *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIClientRolloutArtifact isEqualToArtifact:](self, "isEqualToArtifact:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[TRIClientRollout hash](self->_rollout, "hash");
  v4 = -[NSArray hash](self->_populations, "hash") - v3 + 32 * v3;
  v5 = -[NSDate hash](self->_deploymentDate, "hash");
  return self->_downloadSize - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIClientRolloutArtifact)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  TRIClientRolloutArtifact *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  objc_class *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rollout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("populations"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v4, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        v9 = 0;
        v13 = 0;
LABEL_23:

        goto LABEL_24;
      }
      v39 = *MEMORY[0x1E0CB2D50];
      v40 = CFSTR("Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.populations");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 2, v11);
      objc_msgSend(v4, "failWithError:", v22);

      v9 = 0;
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deploymentDate"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        objc_msgSend(v4, "error");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
        {
          v35 = *MEMORY[0x1E0CB2D50];
          v36 = CFSTR("Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.deploymentDate");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 2, v24);
          objc_msgSend(v4, "failWithError:", v25);

        }
        v11 = 0;
        goto LABEL_21;
      }
      v11 = (void *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("downloadSize"));
        if (v12)
        {
LABEL_7:
          self = -[TRIClientRolloutArtifact initWithRollout:populations:deploymentDate:downloadSize:](self, "initWithRollout:populations:deploymentDate:downloadSize:", v5, v9, v11, v12);
          v13 = self;
LABEL_22:

          goto LABEL_23;
        }
        objc_msgSend(v4, "error");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("downloadSize")) & 1) != 0)
            goto LABEL_7;
          v31 = *MEMORY[0x1E0CB2D50];
          v32 = CFSTR("Missing serialized value for TRIClientRolloutArtifact.downloadSize");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 1, v18);
          objc_msgSend(v4, "failWithError:", v19);
          goto LABEL_20;
        }
LABEL_21:
        v13 = 0;
        goto LABEL_22;
      }
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientRolloutArtifact key \"deploymentDate\" (expected %@, decoded %@)"), v18, v19, 0);
      v33 = *MEMORY[0x1E0CB2D50];
      v34 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 3, v21);
      objc_msgSend(v4, "failWithError:", v28);

    }
    else
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIClientRolloutArtifact key \"populations\" (expected %@, decoded %@)"), v11, v18, 0);
      v37 = *MEMORY[0x1E0CB2D50];
      v38 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 3, v20);
      objc_msgSend(v4, "failWithError:", v21);
    }

LABEL_20:
    goto LABEL_21;
  }
  objc_msgSend(v4, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v41 = *MEMORY[0x1E0CB2D50];
    v42[0] = CFSTR("Retrieved nil serialized value for nonnull TRIClientRolloutArtifact.rollout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIClientRolloutArtifactOCNTErrorDomain"), 2, v9);
    objc_msgSend(v4, "failWithError:", v11);
    goto LABEL_21;
  }
  v13 = 0;
LABEL_24:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TRIClientRollout *rollout;
  NSArray *populations;
  NSDate *deploymentDate;
  id v8;

  v4 = a3;
  rollout = self->_rollout;
  v8 = v4;
  if (rollout)
  {
    objc_msgSend(v4, "encodeObject:forKey:", rollout, CFSTR("rollout"));
    v4 = v8;
  }
  populations = self->_populations;
  if (populations)
  {
    objc_msgSend(v8, "encodeObject:forKey:", populations, CFSTR("populations"));
    v4 = v8;
  }
  deploymentDate = self->_deploymentDate;
  if (deploymentDate)
  {
    objc_msgSend(v8, "encodeObject:forKey:", deploymentDate, CFSTR("deploymentDate"));
    v4 = v8;
  }
  objc_msgSend(v4, "encodeInt64:forKey:", self->_downloadSize, CFSTR("downloadSize"));

}

- (id)description
{
  id v3;
  NSDate *deploymentDate;
  void *v5;
  void *v6;
  __int128 v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = *(_OWORD *)&self->_rollout;
  deploymentDate = self->_deploymentDate;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_downloadSize);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIClientRolloutArtifact | rollout:%@ populations:%@ deploymentDate:%@ downloadSize:%@>"), v8, deploymentDate, v5);

  return v6;
}

- (TRIClientRollout)rollout
{
  return self->_rollout;
}

- (NSArray)populations
{
  return self->_populations;
}

- (NSDate)deploymentDate
{
  return self->_deploymentDate;
}

- (unint64_t)downloadSize
{
  return self->_downloadSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deploymentDate, 0);
  objc_storeStrong((id *)&self->_populations, 0);
  objc_storeStrong((id *)&self->_rollout, 0);
}

+ (id)allReferencedCKRecordKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DC0D90];
  v7[0] = *MEMORY[0x1E0DC0DC0];
  v7[1] = v2;
  v3 = *MEMORY[0x1E0DC0DB8];
  v7[2] = *MEMORY[0x1E0DC0DB0];
  v7[3] = v3;
  v4 = *MEMORY[0x1E0DC0D98];
  v7[4] = *MEMORY[0x1E0DC0DA8];
  v7[5] = v4;
  v5 = *MEMORY[0x1E0DC0D88];
  v7[6] = *MEMORY[0x1E0DC0DA0];
  v7[7] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)artifactFromCKRecord:(id)a3 namespaceDescriptorProvider:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  TRIClientRolloutArtifact *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void **v102;
  uint64_t *v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint8_t buf[4];
  void *v145;
  __int16 v146;
  void *v147;
  __int16 v148;
  void *v149;
  __int16 v150;
  id v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  _QWORD v171[3];

  v171[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v138 = a4;
  objc_msgSend(v8, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0DC0], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      TRILogCategory_Server();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v145 = v94;
        _os_log_error_impl(&dword_1D207F000, v46, OS_LOG_TYPE_ERROR, "RolloutNotification CloudKit record %@ has missing or corrupt rollout id.", buf, 0xCu);

      }
      if (!a5)
      {
        v11 = 0;
        v45 = 0;
LABEL_101:

        goto LABEL_102;
      }
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "recordID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("RolloutNotification CloudKit record %@ has missing or corrupt rollout id."), v48);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v168 = *MEMORY[0x1E0CB2D50];
      v169 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (void *)objc_msgSend(v49, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v13);
      v45 = 0;
      v14 = *a5;
      *a5 = v50;
      goto LABEL_98;
    }
    objc_msgSend(v10, "triNumberValueForField:isNestedValue:", *MEMORY[0x1E0DC0D90], 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      TRILogCategory_Server();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v145 = v95;
        v146 = 2114;
        v147 = v11;
        _os_log_error_impl(&dword_1D207F000, v51, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@ has missing or corrupt deployment id.", buf, 0x16u);

      }
      if (!a5)
      {
        v12 = 0;
        v45 = 0;
LABEL_100:

        goto LABEL_101;
      }
      v52 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "recordID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@ has missing or corrupt deployment id."), v53, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v166 = *MEMORY[0x1E0CB2D50];
      v167 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)objc_msgSend(v54, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v14);
      v45 = 0;
      v15 = *a5;
      *a5 = v55;
      goto LABEL_97;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B60]), "initWithRolloutId:deploymentId:", v11, objc_msgSend(v12, "intValue"));
    objc_msgSend(v10, "triDataForField:", *MEMORY[0x1E0DC0DB0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      TRILogCategory_Server();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v145 = v96;
        v146 = 2114;
        v147 = v11;
        v148 = 2112;
        v149 = v12;
        _os_log_error_impl(&dword_1D207F000, v56, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt encoded rollout definition.", buf, 0x20u);

      }
      if (!a5)
      {
        v14 = 0;
        v45 = 0;
LABEL_98:

        goto LABEL_99;
      }
      v57 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "recordID");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has missing or corrupt encoded rollout definition."), v58, v11, v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v59 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v164 = *MEMORY[0x1E0CB2D50];
      v165 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = (void *)objc_msgSend(v59, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v60);
      v45 = 0;
      v62 = *a5;
      *a5 = v61;
      goto LABEL_95;
    }
    objc_msgSend(v10, "triStringValueForField:isNestedValue:", *MEMORY[0x1E0DC0DB8], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v135 = v13;
      TRILogCategory_Server();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v145 = v108;
        v146 = 2114;
        v147 = v11;
        v148 = 2112;
        v149 = v12;
        _os_log_error_impl(&dword_1D207F000, v63, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt encoded rollout definition signature.", buf, 0x20u);

      }
      if (!a5)
      {
        v15 = 0;
        v45 = 0;
LABEL_97:

        goto LABEL_98;
      }
      v64 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "recordID");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has missing or corrupt encoded rollout definition signature."), v65, v11, v12);
      v66 = objc_claimAutoreleasedReturnValue();

      v67 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v162 = *MEMORY[0x1E0CB2D50];
      v163 = v66;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1);
      v68 = objc_claimAutoreleasedReturnValue();
      v69 = v67;
      v15 = 0;
      v137 = (void *)v68;
      v70 = (void *)objc_msgSend(v69, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v45 = 0;
      v71 = *a5;
      *a5 = v70;
      v60 = (void *)v66;
      v13 = v135;
      goto LABEL_93;
    }
    objc_msgSend(v10, "triDataForField:", *MEMORY[0x1E0DC0DA8]);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if (v136)
    {
      v130 = v14;
      objc_msgSend(v10, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0D98], 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = v16;
      if (!v16)
        goto LABEL_51;
      v17 = v16;
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v133 = v13;
        v18 = v15;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v15 = v18;
        v13 = v133;
        if ((isKindOfClass & 1) == 0)
        {
LABEL_51:
          TRILogCategory_Server();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "recordID");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v145 = v111;
            v146 = 2114;
            v147 = v11;
            v148 = 2112;
            v149 = v12;
            _os_log_error_impl(&dword_1D207F000, v81, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt namespace names.", buf, 0x20u);

          }
          if (!a5)
          {
            v45 = 0;
            v14 = v130;
            v60 = v136;
LABEL_94:
            v62 = v137;
LABEL_95:

            goto LABEL_96;
          }
          v131 = v15;
          v82 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v8, "recordID");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has missing or corrupt namespace names."), v83, v11, v12);
          v84 = objc_claimAutoreleasedReturnValue();

          v85 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v158 = *MEMORY[0x1E0CB2D50];
          v159 = v84;
          v134 = (void *)v84;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
          v129 = objc_claimAutoreleasedReturnValue();
          v86 = (void *)objc_msgSend(v85, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
          v45 = 0;
          v29 = *a5;
          *a5 = v86;
          v14 = v130;
          goto LABEL_89;
        }
      }
      v131 = v15;
      objc_msgSend(v10, "triArrayValueForField:isNestedValue:", *MEMORY[0x1E0DC0DA0], 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v21;
      if (!v21
        || (v22 = v21, objc_msgSend(v21, "count"))
        && (objc_msgSend(v22, "objectAtIndexedSubscript:", 0),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v24 = objc_opt_isKindOfClass(),
            v23,
            (v24 & 1) == 0))
      {
        TRILogCategory_Server();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "recordID");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v145 = v120;
          v146 = 2114;
          v147 = v11;
          v148 = 2112;
          v149 = v12;
          _os_log_error_impl(&dword_1D207F000, v88, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt populations.", buf, 0x20u);

        }
        if (!a5)
        {
          v45 = 0;
          v14 = v130;
          v15 = v131;
          v60 = v136;
LABEL_92:
          v71 = v134;
LABEL_93:

          goto LABEL_94;
        }
        v89 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "recordID");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has missing or corrupt populations."), v90, v11, v12);
        v91 = objc_claimAutoreleasedReturnValue();

        v92 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v156 = *MEMORY[0x1E0CB2D50];
        v157 = v91;
        v129 = v91;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)objc_msgSend(v92, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v29);
        v45 = 0;
        v39 = *a5;
        *a5 = v93;
        goto LABEL_87;
      }
      objc_msgSend(v10, "triDateForField:", *MEMORY[0x1E0DC0D88]);
      v129 = objc_claimAutoreleasedReturnValue();
      if (v129)
      {
        v14 = v130;
        v15 = v131;
        if ((objc_msgSend(a1, "_signature:onData:isValidUsingPublicCertificate:", v131, v130, v136) & 1) != 0)
        {
          v139 = 0;
          objc_msgSend(MEMORY[0x1E0DC0E98], "parseFromData:error:", v130, &v139);
          v25 = objc_claimAutoreleasedReturnValue();
          v128 = v139;
          if (v25)
          {
            if (objc_msgSend(a1, "_isStructurallyValidWithRollout:deployment:namespaceNames:populations:deploymentDate:", v25, v13, v137, v134, v129))
            {
              v126 = (void *)v25;
              +[TRISetupAssistantFetchUtils getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:](TRISetupAssistantFetchUtils, "getIncompatibleNamespaceNamesForTriClientRollout:namespaceDescriptorProvider:", v25, v138);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v127, "count");
              TRILogCategory_Server();
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = v27;
              if (v26)
              {
                v29 = v128;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v127, "allObjects");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v145 = v30;
                  _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEFAULT, "Found the following incompatible namespace names: %{public}@", buf, 0xCu);

                }
                if (a5)
                {
                  v31 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v127, "allObjects");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "stringWithFormat:", CFSTR("Found the following incompatible namespace names: %@"), v32);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  v34 = objc_alloc(MEMORY[0x1E0CB35C8]);
                  v140 = *MEMORY[0x1E0CB2D50];
                  v141 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = (void *)objc_msgSend(v34, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v35);
                  v37 = *a5;
                  *a5 = v36;

                  v39 = v126;
                  v38 = v127;
LABEL_77:
                  v45 = 0;
                  goto LABEL_86;
                }
                v45 = 0;
                v39 = v126;
              }
              else
              {
                v29 = v128;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v13, "shortDesc");
                  v125 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v145 = v125;
                  _os_log_debug_impl(&dword_1D207F000, v28, OS_LOG_TYPE_DEBUG, "Decoded valid and device-compatible rollout notification: %{public}@.  This means we are ack’ing the CK notification, not acting on it.", buf, 0xCu);

                }
                v39 = v126;
                v45 = -[TRIClientRolloutArtifact initWithRollout:populations:deploymentDate:downloadSize:]([TRIClientRolloutArtifact alloc], "initWithRollout:populations:deploymentDate:downloadSize:", v126, v134, v129, objc_msgSend(v136, "length") + objc_msgSend(v130, "length") + objc_msgSend(v131, "length"));
              }
              v38 = v127;
              goto LABEL_86;
            }
            v45 = 0;
            v39 = (void *)v25;
            v29 = v128;
          }
          else
          {
            TRILogCategory_Server();
            v112 = objc_claimAutoreleasedReturnValue();
            v29 = v128;
            if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "recordID");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v145 = v124;
              v146 = 2114;
              v147 = v11;
              v148 = 2112;
              v149 = v12;
              v150 = 2114;
              v151 = v128;
              _os_log_error_impl(&dword_1D207F000, v112, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has unparseable rollout definition: %{public}@", buf, 0x2Au);

              v14 = v130;
            }

            if (a5)
            {
              v113 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v8, "recordID");
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has unparseable rollout definition: %@"), v114, v11, v12, v128);
              v115 = objc_claimAutoreleasedReturnValue();

              v116 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v142 = *MEMORY[0x1E0CB2D50];
              v143 = v115;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              v118 = (void *)objc_msgSend(v116, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v117);
              v119 = *a5;
              *a5 = v118;

              v38 = (id)v115;
              v39 = 0;
              goto LABEL_77;
            }
            v39 = 0;
            v45 = 0;
          }
LABEL_88:

LABEL_89:
          v15 = v131;
          goto LABEL_90;
        }
        TRILogCategory_Server();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "recordID");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v145 = v123;
          v146 = 2114;
          v147 = v11;
          v148 = 2112;
          v149 = v12;
          _os_log_error_impl(&dword_1D207F000, v104, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ does not have a valid signature.", buf, 0x20u);

          v14 = v130;
        }

        if (!a5)
        {
          v45 = 0;
LABEL_90:
          v60 = v136;
          v80 = (id)v129;
          goto LABEL_91;
        }
        v105 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "recordID");
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ does not have a valid signature."), v106, v11, v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v152 = *MEMORY[0x1E0CB2D50];
        v153 = v29;
        v101 = (void *)MEMORY[0x1E0C99D80];
        v102 = &v153;
        v103 = &v152;
LABEL_71:
        objc_msgSend(v101, "dictionaryWithObjects:forKeys:count:", v102, v103, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = (void *)objc_msgSend(v100, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v39);
        v45 = 0;
        v38 = *a5;
        *a5 = v107;
LABEL_86:

LABEL_87:
        v14 = v130;
        goto LABEL_88;
      }
      TRILogCategory_Server();
      v97 = objc_claimAutoreleasedReturnValue();
      v14 = v130;
      v15 = v131;
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v145 = v122;
        v146 = 2114;
        v147 = v11;
        v148 = 2112;
        v149 = v12;
        _os_log_error_impl(&dword_1D207F000, v97, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has unreadable deploymentDate.", buf, 0x20u);

        v14 = v130;
      }

      if (a5)
      {
        v98 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "recordID");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has unreadable deploymentDate."), v99, v11, v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v100 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v154 = *MEMORY[0x1E0CB2D50];
        v155 = v29;
        v101 = (void *)MEMORY[0x1E0C99D80];
        v102 = &v155;
        v103 = &v154;
        goto LABEL_71;
      }
      v80 = 0;
      v45 = 0;
    }
    else
    {
      TRILogCategory_Server();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "recordID");
        v109 = v15;
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v145 = v110;
        v146 = 2114;
        v147 = v11;
        v148 = 2112;
        v149 = v12;
        _os_log_error_impl(&dword_1D207F000, v72, OS_LOG_TYPE_ERROR, "CloudKit record %@ with rollout id %{public}@.%@ has missing or corrupt public certificate.", buf, 0x20u);

        v15 = v109;
      }

      if (!a5)
      {
        v60 = 0;
        v45 = 0;
LABEL_96:

        goto LABEL_97;
      }
      v132 = v15;
      v73 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "recordID");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "stringWithFormat:", CFSTR("CloudKit record %@ with rollout id %@.%@ has missing or corrupt public certificate."), v74, v11, v12);
      v75 = objc_claimAutoreleasedReturnValue();

      v76 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v160 = *MEMORY[0x1E0CB2D50];
      v161 = v75;
      v137 = (void *)v75;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1);
      v77 = objc_claimAutoreleasedReturnValue();
      v78 = v76;
      v15 = v132;
      v134 = (void *)v77;
      v79 = (void *)objc_msgSend(v78, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1);
      v45 = 0;
      v80 = *a5;
      *a5 = v79;
    }
    v60 = v136;
LABEL_91:

    goto LABEL_92;
  }
  TRILogCategory_Server();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "recordID");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v145 = v87;
    _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "Could not create rollout artifact from CloudKit record %@.", buf, 0xCu);

  }
  if (a5)
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "recordID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("Could not create rollout artifact from CloudKit record %@."), v42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v170 = *MEMORY[0x1E0CB2D50];
    v171[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v171, &v170, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "initWithDomain:code:userInfo:", CFSTR("TRIGeneralErrorDomain"), 1, v12);
    v45 = 0;
    v13 = *a5;
    *a5 = v44;
LABEL_99:

    goto LABEL_100;
  }
  v45 = 0;
LABEL_102:

  return v45;
}

+ (BOOL)_signature:(id)a3 onData:(id)a4 isValidUsingPublicCertificate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a3;
  v8 = a4;
  +[TRISignatureKey keyFromData:](TRISignatureKey, "keyFromData:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "validateBase64Signature:data:", v7, v8);
  else
    v11 = 0;

  return v11;
}

+ (BOOL)_isStructurallyValidWithRollout:(id)a3 deployment:(id)a4 namespaceNames:(id)a5 populations:(id)a6 deploymentDate:(id)a7
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __CFString *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  int v35;
  BOOL v36;
  void *v37;
  void *v38;
  BOOL v39;
  NSObject *v40;
  NSObject *v41;
  int v42;
  const char *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  __CFString *v47;
  const char *v48;
  int v49;
  const char *v50;
  int v51;
  int v52;
  int v54;
  NSObject *v55;
  int v56;
  void *v57;
  int v58;
  __CFString *v59;
  int v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[4];
  NSObject *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  __CFString *v76;
  __int16 v77;
  int v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v62 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v68 != v15)
          objc_enumerationMutation(v12);
        v17 = *(__CFString **)(*((_QWORD *)&v67 + 1) + 8 * i);
        if ((-[__CFString triIsPathSafe](v17, "triIsPathSafe") & 1) == 0)
        {
          TRILogCategory_Server();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v28 = v62;
            objc_msgSend(v62, "rolloutId");
            v41 = objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v62, "deploymentId");
            *(_DWORD *)buf = 138543874;
            v72 = v41;
            v73 = 1024;
            v74 = v42;
            v75 = 2114;
            v76 = v17;
            v43 = "Rollout artifact with id %{public}@.%d has namespace name \"%{public}@\" which is not path-safe.";
            goto LABEL_45;
          }
LABEL_32:
          v28 = v62;
LABEL_33:

          v39 = 0;
          v18 = v12;
          goto LABEL_50;
        }
        if (objc_msgSend(v11, "containsObject:", v17))
        {
          TRILogCategory_Server();
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            goto LABEL_32;
          v28 = v62;
          objc_msgSend(v62, "rolloutId");
          v41 = objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v62, "deploymentId");
          *(_DWORD *)buf = 138543874;
          v72 = v41;
          v73 = 1024;
          v74 = v52;
          v75 = 2114;
          v76 = v17;
          v43 = "Rollout artifact with id %{public}@.%d has repeated namespaceNames entry \"%{public}@\".";
LABEL_45:
          _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, v43, buf, 0x1Cu);

          goto LABEL_33;
        }
        objc_msgSend(v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_opt_new();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v9, "selectedNamespaceArray");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (!v20)
    goto LABEL_19;
  v21 = v20;
  v22 = *(_QWORD *)v64;
  v61 = v9;
  while (2)
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v64 != v22)
        objc_enumerationMutation(v19);
      v24 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
      objc_msgSend(v24, "name", v61);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v18, "containsObject:", v25);

      if (v26)
      {
        TRILogCategory_Server();
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
LABEL_37:
          v9 = v61;
          v28 = v62;
          goto LABEL_38;
        }
        v28 = v62;
        objc_msgSend(v62, "rolloutId");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v62, "deploymentId");
        objc_msgSend(v24, "name");
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = v45;
        v73 = 1024;
        v74 = v46;
        v75 = 2114;
        v76 = v47;
        v48 = "Rollout artifact with id %{public}@.%d has repeated selected_namespace name \"%{public}@\".";
LABEL_52:
        _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, v48, buf, 0x1Cu);

        v9 = v61;
        goto LABEL_38;
      }
      if (!objc_msgSend(v24, "compatibilityVersionArray_Count"))
      {
        TRILogCategory_Server();
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_37;
        v28 = v62;
        objc_msgSend(v62, "rolloutId");
        v45 = objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v62, "deploymentId");
        objc_msgSend(v24, "name");
        v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v72 = v45;
        v73 = 1024;
        v74 = v54;
        v75 = 2114;
        v76 = v47;
        v48 = "Rollout artifact with id %{public}@.%d declares empty NCV array for namespace \"%{public}@\".";
        goto LABEL_52;
      }
      objc_msgSend(v24, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v27);

    }
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    v9 = v61;
    if (v21)
      continue;
    break;
  }
LABEL_19:

  if ((objc_msgSend(v11, "isEqualToSet:", v18) & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    v28 = v62;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    objc_msgSend(v62, "rolloutId");
    v44 = objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v62, "deploymentId");
    *(_DWORD *)buf = 138543618;
    v72 = v44;
    v73 = 1024;
    v74 = v49;
    v50 = "Rollout artifact with id %{public}@.%d has inconsistent namespace name collections.";
    goto LABEL_43;
  }
  v28 = v62;
  objc_msgSend(v62, "rolloutId");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "triIsPathSafePlausibleUniqueId");

  if ((v30 & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    objc_msgSend(v62, "rolloutId");
    v44 = objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v62, "deploymentId");
    *(_DWORD *)buf = 138543618;
    v72 = v44;
    v73 = 1024;
    v74 = v51;
    v50 = "Rollout artifact with id %{public}@.%d has rolloutId which is not a plausible uniqueId.";
LABEL_43:
    _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, v50, buf, 0x12u);
LABEL_38:

LABEL_48:
LABEL_49:
    v39 = 0;
    goto LABEL_50;
  }
  if (!objc_msgSend(v9, "hasRolloutId"))
    goto LABEL_47;
  objc_msgSend(v62, "rolloutId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rolloutId");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v31, "isEqualToString:", v32) || (objc_msgSend(v9, "hasDeploymentId") & 1) == 0)
  {

LABEL_47:
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v62, "rolloutId");
      v55 = objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v62, "deploymentId");
      v57 = v9;
      v58 = objc_msgSend(v9, "hasRolloutId");
      if (v58)
      {
        objc_msgSend(v57, "rolloutId");
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = CFSTR("(unset)");
      }
      if (objc_msgSend(v57, "hasDeploymentId"))
        v60 = objc_msgSend(v57, "deploymentId");
      else
        v60 = -1;
      *(_DWORD *)buf = 138544130;
      v72 = v55;
      v73 = 1024;
      v74 = v56;
      v75 = 2114;
      v76 = v59;
      v77 = 1024;
      v78 = v60;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Rollout artifact with id %{public}@.%d contains rollout definition with mismatched identifier: %{public}@.%d", buf, 0x22u);
      if (v58)

      v9 = v57;
      v28 = v62;
    }
    goto LABEL_48;
  }
  v33 = v9;
  v34 = objc_msgSend(v62, "deploymentId");
  v35 = objc_msgSend(v33, "deploymentId");

  v36 = v34 == v35;
  v9 = v33;
  if (!v36)
    goto LABEL_47;
  if (objc_msgSend(v33, "hasRampId"))
  {
    objc_msgSend(v33, "rampId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    TRIValidateRampId();
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v38)
      goto LABEL_49;
  }
  v39 = 1;
LABEL_50:

  return v39;
}

- (TRIRolloutDeployment)deployment
{
  id v2;
  void *v3;
  void *v4;
  void *v6;

  -[TRIClientRolloutArtifact rollout](self, "rollout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0DC0B60]);
  objc_msgSend(v6, "rolloutId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithRolloutId:deploymentId:", v3, objc_msgSend(v6, "deploymentId"));

  return (TRIRolloutDeployment *)v4;
}

- (NSArray)namespaceNames
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[TRIClientRolloutArtifact rollout](self, "rollout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "selectedNamespaceArray_Count"));

  -[TRIClientRolloutArtifact rollout](self, "rollout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedNamespaceArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__TRIClientRolloutArtifact_Utils__namespaceNames__block_invoke;
  v10[3] = &unk_1E9333EB8;
  v8 = v5;
  v11 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

  return (NSArray *)v8;
}

void __49__TRIClientRolloutArtifact_Utils__namespaceNames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)data
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;

  v4 = objc_alloc(MEMORY[0x1E0DC0F58]);
  -[TRIClientRolloutArtifact populations](self, "populations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  -[TRIClientRolloutArtifact populations](self, "populations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __39__TRIClientRolloutArtifact_Utils__data__block_invoke;
  v20 = &unk_1E9331400;
  v8 = v6;
  v21 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v17);

  v9 = (void *)objc_opt_new();
  -[TRIClientRolloutArtifact rollout](self, "rollout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRollout:", v10);

  objc_msgSend(v9, "setPopulationsArray:", v8);
  v11 = objc_alloc(MEMORY[0x1E0DC0F50]);
  -[TRIClientRolloutArtifact deploymentDate](self, "deploymentDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithDate:", v12);
  objc_msgSend(v9, "setDeploymentDate:", v13);

  objc_msgSend(v9, "setDownloadSize:", -[TRIClientRolloutArtifact downloadSize](self, "downloadSize"));
  objc_msgSend(v9, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientRolloutArtifact+Utils.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"), v17, v18, v19, v20);

  }
  return v14;
}

uint64_t __39__TRIClientRolloutArtifact_Utils__data__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", objc_msgSend(a2, "unsignedIntValue"));
}

+ (id)artifactWithTransientData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  TRIClientRolloutArtifact *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  const char *v15;
  TRIClientRolloutArtifact *v16;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  +[TRIPBMessage parseFromData:error:](TRIPersistedClientRolloutArtifact, "parseFromData:error:", a3, &v24);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v24;
  if (!v3)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Failed to decode TRIPersistedClientRolloutArtifact: %{public}@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "hasRollout") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      v16 = 0;
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    v15 = "Cannot decode message of type %@ with missing field: rollout";
LABEL_16:
    _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);

    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "hasDeploymentDate") & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v14;
    v15 = "Cannot decode message of type %@ with missing field: deploymentDate";
    goto LABEL_16;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "populationsArray_Count"));
  objc_msgSend(v3, "populationsArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __61__TRIClientRolloutArtifact_Utils__artifactWithTransientData___block_invoke;
  v22 = &unk_1E93306F0;
  v7 = v5;
  v23 = v7;
  objc_msgSend(v6, "enumerateValuesWithBlock:", &v19);

  v8 = [TRIClientRolloutArtifact alloc];
  objc_msgSend(v3, "rollout", v19, v20, v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deploymentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasDownloadSize"))
    v12 = objc_msgSend(v3, "downloadSize");
  else
    v12 = 0;
  v16 = -[TRIClientRolloutArtifact initWithRollout:populations:deploymentDate:downloadSize:](v8, "initWithRollout:populations:deploymentDate:downloadSize:", v9, v7, v11, v12);

LABEL_12:
  return v16;
}

void __61__TRIClientRolloutArtifact_Utils__artifactWithTransientData___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
