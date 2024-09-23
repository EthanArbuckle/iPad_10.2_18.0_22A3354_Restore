@implementation PBFSnapshotDefinitionSupportedOrientationForDeviceClass

void ___PBFSnapshotDefinitionSupportedOrientationForDeviceClass_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = 0;
  while (1)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v1;
    if (v0 == 1)
    {
      objc_msgSend(v1, "addIndex:", 4);
      objc_msgSend(v8, "addIndex:", 4);
      objc_msgSend(v8, "addIndex:", 3);
      objc_msgSend(v8, "addIndex:", 1);
      v2 = 2;
      v3 = &_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_padSupportedOrientations;
LABEL_7:
      objc_msgSend(v8, "addIndex:", v2);
      v4 = objc_msgSend(v8, "copy");
      v5 = (void *)*v3;
      *v3 = v4;

      goto LABEL_8;
    }
    objc_msgSend(v1, "addIndex:", 1);
    v2 = 1;
    v3 = &_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_phoneSupportedOrientations;
    if (!v0)
      goto LABEL_7;
    if (v0 == 2)
      break;
LABEL_8:

    if (++v0 == 3)
      return;
  }
  objc_msgSend(v8, "addIndex:", 1);
  v6 = objc_msgSend(v8, "copy");
  v7 = (void *)_PBFSnapshotDefinitionSupportedOrientationForDeviceClass_tvSupportedOrientations;
  _PBFSnapshotDefinitionSupportedOrientationForDeviceClass_tvSupportedOrientations = v6;

}

@end
