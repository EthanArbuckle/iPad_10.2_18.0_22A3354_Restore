@implementation SFPunchout

- (SFPunchout)initWithProtobuf:(id)a3
{
  id v4;
  SFPunchout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  SFUserActivityData *v21;
  void *v22;
  SFUserActivityData *v23;
  void *v24;
  void *v25;
  SFPunchout *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SFPunchout;
  v5 = -[SFPunchout init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout setBundleIdentifier:](v5, "setBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout setLabel:](v5, "setLabel:", v11);

    }
    objc_msgSend(v4, "urls");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "urls", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          _SFPBURLHandwrittenTranslator(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v16);
    }

    -[SFPunchout setUrls:](v5, "setUrls:", v13);
    objc_msgSend(v4, "userActivityData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFUserActivityData alloc];
      objc_msgSend(v4, "userActivityData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFUserActivityData initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFPunchout setUserActivityData:](v5, "setUserActivityData:", v23);

    }
    objc_msgSend(v4, "actionTarget");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "actionTarget");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout setActionTarget:](v5, "setActionTarget:", v25);

    }
    if (objc_msgSend(v4, "isRunnableInBackground"))
      -[SFPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", objc_msgSend(v4, "isRunnableInBackground"));
    if (objc_msgSend(v4, "hasClip"))
      -[SFPunchout setHasClip:](v5, "setHasClip:", objc_msgSend(v4, "hasClip"));
    if (objc_msgSend(v4, "forceOpenInBrowser"))
      -[SFPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", objc_msgSend(v4, "forceOpenInBrowser"));
    v26 = v5;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setIsRunnableInBackground:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isRunnableInBackground = a3;
}

- (BOOL)hasIsRunnableInBackground
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasClip:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasClip = a3;
}

- (BOOL)hasHasClip
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setForceOpenInBrowser:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_forceOpenInBrowser = a3;
}

- (BOOL)hasForceOpenInBrowser
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (SFPunchout)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPunchout *v6;
  SFPunchout *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPunchout initWithData:]([_SFPBPunchout alloc], "initWithData:", v5);
  v7 = -[SFPunchout initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPunchout *v6;

  v4 = a3;
  v6 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", self);
  -[_SFPBPunchout data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPunchout *v2;
  void *v3;

  v2 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", self);
  -[_SFPBPunchout dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPunchout *v2;
  void *v3;

  v2 = -[_SFPBPunchout initWithFacade:]([_SFPBPunchout alloc], "initWithFacade:", self);
  -[_SFPBPunchout jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFPunchout name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setName:", v6);

  -[SFPunchout bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setBundleIdentifier:", v8);

  -[SFPunchout label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setLabel:", v10);

  -[SFPunchout urls](self, "urls");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setUrls:", v12);

  -[SFPunchout userActivityData](self, "userActivityData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setUserActivityData:", v14);

  -[SFPunchout actionTarget](self, "actionTarget");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setActionTarget:", v16);

  objc_msgSend(v4, "setIsRunnableInBackground:", -[SFPunchout isRunnableInBackground](self, "isRunnableInBackground"));
  objc_msgSend(v4, "setHasClip:", -[SFPunchout hasClip](self, "hasClip"));
  objc_msgSend(v4, "setForceOpenInBrowser:", -[SFPunchout forceOpenInBrowser](self, "forceOpenInBrowser"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPunchout *v5;
  SFPunchout *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  uint64_t v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  BOOL v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v5 = (SFPunchout *)a3;
  if (self == v5)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    if (-[SFPunchout isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFPunchout name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        LOBYTE(v12) = 0;
LABEL_49:

        goto LABEL_50;
      }
      -[SFPunchout name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFPunchout name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPunchout name](v6, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v11))
        {
          LOBYTE(v12) = 0;
          goto LABEL_47;
        }
        v67 = v11;
        v68 = v10;
      }
      -[SFPunchout bundleIdentifier](self, "bundleIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPunchout bundleIdentifier](v6, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v13 == 0) != (v14 != 0))
      {
        v66 = v14;
        -[SFPunchout bundleIdentifier](self, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          -[SFPunchout bundleIdentifier](self, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPunchout bundleIdentifier](v6, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
          {

LABEL_44:
LABEL_45:
            LOBYTE(v12) = 0;
            goto LABEL_46;
          }
          v64 = v17;
          v65 = v13;
          v3 = v16;
          v18 = v15;
        }
        else
        {
          v65 = v13;
          v18 = 0;
        }
        -[SFPunchout label](self, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPunchout label](v6, "label");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v18;
        v22 = v3;
        if ((v19 == 0) != (v20 != 0))
        {
          v63 = v20;
          v62 = v19;
          -[SFPunchout label](self, "label");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            -[SFPunchout label](self, "label");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPunchout label](v6, "label");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v23, "isEqual:", v24) & 1) == 0)
            {

              if (v21)
              {

              }
              goto LABEL_45;
            }
            v59 = v24;
            v60 = v23;
            v25 = v21;
          }
          else
          {
            v25 = v21;
          }
          -[SFPunchout urls](self, "urls");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPunchout urls](v6, "urls");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v25;
          v22 = v3;
          if ((v26 == 0) != (v27 != 0))
          {
            v58 = v27;
            -[SFPunchout urls](self, "urls");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            if (v57)
            {
              -[SFPunchout urls](self, "urls");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPunchout urls](v6, "urls");
              v56 = v28;
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v28, "isEqual:"))
              {
                LOBYTE(v12) = 0;
                v34 = v57;
                goto LABEL_70;
              }
              v55 = v21;
            }
            else
            {
              v55 = v21;
            }
            -[SFPunchout userActivityData](self, "userActivityData");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPunchout userActivityData](v6, "userActivityData");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v29 == 0) != (v30 != 0))
            {
              v53 = v30;
              -[SFPunchout userActivityData](self, "userActivityData");
              v31 = objc_claimAutoreleasedReturnValue();
              v52 = v29;
              if (v31)
              {
                -[SFPunchout userActivityData](self, "userActivityData");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFPunchout userActivityData](v6, "userActivityData");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = v32;
                if (!objc_msgSend(v32, "isEqual:"))
                {
                  LOBYTE(v12) = 0;
                  v38 = (void *)v31;
                  v21 = v55;
LABEL_68:

LABEL_69:
                  v34 = v57;
                  if (!v57)
                  {
LABEL_71:

                    if (v61)
                    {

                    }
                    if (v21)
                    {

                    }
LABEL_46:
                    v11 = v67;
                    v10 = v68;
                    if (!v9)
                    {
LABEL_48:

                      goto LABEL_49;
                    }
LABEL_47:

                    goto LABEL_48;
                  }
LABEL_70:

                  goto LABEL_71;
                }
                v49 = (void *)v31;
              }
              else
              {
                v49 = 0;
              }
              -[SFPunchout actionTarget](self, "actionTarget");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPunchout actionTarget](v6, "actionTarget");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v35 == 0) == (v36 != 0))
              {

                LOBYTE(v12) = 0;
                v21 = v55;
                goto LABEL_67;
              }
              v47 = v36;
              -[SFPunchout actionTarget](self, "actionTarget");
              v21 = v55;
              v45 = v35;
              v46 = objc_claimAutoreleasedReturnValue();
              if (!v46
                || (-[SFPunchout actionTarget](self, "actionTarget"),
                    v48 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFPunchout actionTarget](v6, "actionTarget"),
                    v44 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v48, "isEqual:")))
              {
                v39 = -[SFPunchout isRunnableInBackground](self, "isRunnableInBackground");
                if (v39 == -[SFPunchout isRunnableInBackground](v6, "isRunnableInBackground")
                  && (v40 = -[SFPunchout hasClip](self, "hasClip"), v40 == -[SFPunchout hasClip](v6, "hasClip")))
                {
                  v42 = -[SFPunchout forceOpenInBrowser](self, "forceOpenInBrowser");
                  v12 = v42 ^ -[SFPunchout forceOpenInBrowser](v6, "forceOpenInBrowser") ^ 1;
                  v41 = v12;
                }
                else
                {
                  LOBYTE(v12) = 0;
                  v41 = 0;
                }
                v37 = (void *)v46;
                if (!v46)
                {
                  v43 = v47;
                  LOBYTE(v12) = v41;
                  goto LABEL_66;
                }
              }
              else
              {
                LOBYTE(v12) = 0;
                v37 = (void *)v46;
              }

              v43 = v47;
LABEL_66:

LABEL_67:
              v38 = v49;
              if (!v49)
                goto LABEL_69;
              goto LABEL_68;
            }

            if (v57)
            {

            }
            v21 = v55;
            v27 = v58;
          }

          if (v61)
          {

          }
          v19 = v62;
          v20 = v63;
        }

        if (v21)
        {

        }
        v13 = v65;
        v14 = v66;
      }

      goto LABEL_44;
    }
    LOBYTE(v12) = 0;
  }
LABEL_50:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  -[SFPunchout name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFPunchout bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFPunchout label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFPunchout urls](self, "urls");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  -[SFPunchout userActivityData](self, "userActivityData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[SFPunchout actionTarget](self, "actionTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 ^ objc_msgSend(v13, "hash");
  v15 = v10 ^ v14 ^ -[SFPunchout isRunnableInBackground](self, "isRunnableInBackground");
  v16 = -[SFPunchout hasClip](self, "hasClip");
  v17 = v15 ^ v16 ^ -[SFPunchout forceOpenInBrowser](self, "forceOpenInBrowser");

  return v17;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SFUserActivityData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (void)setActionTarget:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isRunnableInBackground
{
  return self->_isRunnableInBackground;
}

- (BOOL)hasClip
{
  return self->_hasClip;
}

- (BOOL)forceOpenInBrowser
{
  return self->_forceOpenInBrowser;
}

- (NSURL)cachedOpenableURL
{
  return self->_cachedOpenableURL;
}

- (void)setCachedOpenableURL:(id)a3
{
  objc_storeStrong((id *)&self->_cachedOpenableURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOpenableURL, 0);
  objc_storeStrong((id *)&self->_actionTarget, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSURL)preferredOpenableURL
{
  void *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[SFPunchout cachedOpenableURL](self, "cachedOpenableURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SFPunchout urls](self, "urls", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (-[SFPunchout canOpenURL:](self, "canOpenURL:", v10))
          {
            -[SFPunchout setCachedOpenableURL:](self, "setCachedOpenableURL:", v10);
            v13 = v10;

            return (NSURL *)v13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }

    -[SFPunchout urls](self, "urls");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPunchout setCachedOpenableURL:](self, "setCachedOpenableURL:", v12);

  }
  -[SFPunchout cachedOpenableURL](self, "cachedOpenableURL");
  return (NSURL *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canOpenURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isApplicationAvailableToOpenURL:error:", v4, 0);

  return v6;
}

+ (SFPunchout)punchoutWithURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return (SFPunchout *)0;
  v8 = a3;
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFPunchout punchoutWithURLs:](SFPunchout, "punchoutWithURLs:", v5, v8, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SFPunchout *)v6;
}

+ (SFPunchout)punchoutWithURLs:(id)a3
{
  id v3;
  SFPunchout *v4;

  v3 = a3;
  v4 = objc_alloc_init(SFPunchout);
  -[SFPunchout setUrls:](v4, "setUrls:", v3);

  return v4;
}

@end
