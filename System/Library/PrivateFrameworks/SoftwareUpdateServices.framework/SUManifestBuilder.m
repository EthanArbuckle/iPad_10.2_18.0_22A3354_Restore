@implementation SUManifestBuilder

+ (id)manifestFromDescriptor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id result;
  __CFString *v44;
  uint64_t v45;
  uint64_t v46;

  v4 = objc_msgSend(a3, "sepDigest");
  v5 = objc_msgSend(a3, "rsepDigest");
  v6 = objc_msgSend(a3, "sepTBMDigest");
  v7 = objc_msgSend(a3, "rsepTBMDigest");
  SULogInfo(CFSTR("sepDigest = %@"), v8, v9, v10, v11, v12, v13, v14, v4);
  SULogInfo(CFSTR("rsepDigest = %@"), v15, v16, v17, v18, v19, v20, v21, v5);
  SULogInfo(CFSTR("sepTBMDigest = %@"), v22, v23, v24, v25, v26, v27, v28, v6);
  SULogInfo(CFSTR("rsepTBMDigest = %@"), v29, v30, v31, v32, v33, v34, v35, v7);
  if (v4 && v5)
  {
    SULogInfo(CFSTR("building pre-manifest"), v36, v37, v38, v39, v40, v41, v42, v45);
    result = buildPreManifest(v4, v6, v5, v7);
    if (result)
      return result;
    v44 = CFSTR("failed to create required pre-manifest");
  }
  else
  {
    v46 = v4;
    v44 = CFSTR("manifest required and missing one of sepDigest (%@) or rsepDigest(%@)");
  }
  SULogInfo(v44, v36, v37, v38, v39, v40, v41, v42, v46);
  return 0;
}

@end
