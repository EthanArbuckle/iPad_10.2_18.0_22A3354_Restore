@implementation OADBlip

- (void)setMainSubBlip:(id)a3
{
  objc_storeStrong((id *)&self->mMainSubBlip, a3);
}

- (unsigned)referenceCount
{
  return &self->mReferenceCount;
}

- (id)mainSubBlip
{
  return self->mMainSubBlip;
}

- (void)setAltSubBlip:(id)a3
{
  objc_storeStrong((id *)&self->mAltSubBlip, a3);
}

- (id)altSubBlip
{
  return self->mAltSubBlip;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[OADSubBlip hash](self->mMainSubBlip, "hash");
  return -[OADSubBlip hash](self->mAltSubBlip, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  objc_object **v5;
  char v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v5 = (objc_object **)v4;
  if (!v5 || !TCObjectEqual((objc_object *)self->mMainSubBlip, v5[2]))
    goto LABEL_6;
  v6 = TCObjectEqual((objc_object *)self->mAltSubBlip, v5[3]);
LABEL_7:

  return v6;
}

+ (id)pathExtensionForBlipType:(int)a3
{
  if ((a3 - 1) > 9)
    return 0;
  else
    return off_24F39D8B0[a3 - 1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAltSubBlip, 0);
  objc_storeStrong((id *)&self->mMainSubBlip, 0);
}

@end
