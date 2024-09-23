@implementation ICStoreArtworkSizeInfo

- (int64_t)type
{
  return self->_type;
}

- (CGSize)maxSupportedSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxSupportedSize.width;
  height = self->_maxSupportedSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)hasMaxSupportedSize
{
  return self->_hasMaxSupportedSize;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setMaxSupportedSize:(CGSize)a3
{
  self->_maxSupportedSize = a3;
}

- (void)setHasMaxSupportedSize:(BOOL)a3
{
  self->_hasMaxSupportedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSizes, 0);
}

- (BOOL)isEqual:(id)a3
{
  ICStoreArtworkSizeInfo *v4;
  ICStoreArtworkSizeInfo *v5;
  int64_t v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  _BOOL4 v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = (ICStoreArtworkSizeInfo *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[ICStoreArtworkSizeInfo isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      v6 = -[ICStoreArtworkSizeInfo type](self, "type");
      if (v6 == -[ICStoreArtworkSizeInfo type](v5, "type"))
      {
        -[ICStoreArtworkSizeInfo supportedSizes](self, "supportedSizes");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        -[ICStoreArtworkSizeInfo supportedSizes](v5, "supportedSizes");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        if (v7 == v8)
        {

        }
        else
        {
          v9 = v8;
          v10 = objc_msgSend(v7, "isEqual:", v8);

          if ((v10 & 1) == 0)
            goto LABEL_11;
        }
        v12 = -[ICStoreArtworkSizeInfo hasMaxSupportedSize](self, "hasMaxSupportedSize");
        if (v12 == -[ICStoreArtworkSizeInfo hasMaxSupportedSize](v5, "hasMaxSupportedSize"))
        {
          -[ICStoreArtworkSizeInfo maxSupportedSize](self, "maxSupportedSize");
          v15 = v14;
          v17 = v16;
          -[ICStoreArtworkSizeInfo maxSupportedSize](v5, "maxSupportedSize");
          v11 = v17 == v19 && v15 == v18;
          goto LABEL_12;
        }
      }
LABEL_11:
      v11 = 0;
LABEL_12:

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int64_t type;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t height;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t width;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  int64_t v99;
  uint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t data;

  v3 = MSVHasherSharedSeed();
  v5 = v4;
  v6 = v3 ^ 0x736F6D6570736575;
  v7 = v4 ^ 0x646F72616E646F6DLL;
  v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v5 ^ 0x7465646279746573 ^ v11;
  v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  v14 = v8 + v12;
  v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  v16 = v15 + __ROR8__(v6 + v7, 32);
  v108 = __ROR8__(v14 + v13, 32);
  v113 = v16 ^ __ROR8__(v15, 43);
  v17 = v16 ^ v11;
  v103 = (v14 + v13) ^ __ROR8__(v13, 47);

  type = self->_type;
  v19 = (v17 + v103) ^ __ROR8__(v103, 51);
  v20 = v108 + (v113 ^ type);
  v21 = __ROR8__(v113 ^ type, 48);
  v22 = (v20 ^ v21) + __ROR8__(v17 + v103, 32);
  v23 = v22 ^ __ROR8__(v20 ^ v21, 43);
  v24 = v20 + v19;
  v109 = __ROR8__(v24, 32);
  v114 = v23;
  v99 = v22 ^ type;
  v104 = v24 ^ __ROR8__(v19, 47);
  v25 = self->_supportedSizes;
  data = -[NSArray hash](v25, "hash");
  v26 = (v99 + v104) ^ __ROR8__(v104, 51);
  v27 = v109 + (v114 ^ data);
  v28 = __ROR8__(v114 ^ data, 48);
  v29 = (v27 ^ v28) + __ROR8__(v99 + v104, 32);
  v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  v31 = v27 + v26;
  v110 = __ROR8__(v31, 32);
  v115 = v30;
  v100 = v29 ^ data;
  v105 = v31 ^ __ROR8__(v26, 47);

  height = (unint64_t)self->_maxSupportedSize.height;
  v33 = (self->_hasMaxSupportedSize | 0x1800000000000000) + 0x400000000000000;
  v118 = v33;
  if ((v33 & 0x400000000000000) != 0)
  {
    if ((v33 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v118);

      v33 = v118;
    }
    v40 = v33 & 0xFFFFFFFFFFFFFFLL | (height << 32);
    v41 = (v100 + v105) ^ __ROR8__(v105, 51);
    v42 = v110 + (v40 ^ v115);
    v43 = __ROR8__(v40 ^ v115, 48);
    v44 = (v42 ^ v43) + __ROR8__(v100 + v105, 32);
    v45 = v44 ^ __ROR8__(v42 ^ v43, 43);
    v46 = v42 + v41;
    v111 = __ROR8__(v46, 32);
    v116 = v45;
    v101 = v44 ^ v40;
    v106 = v46 ^ __ROR8__(v41, 47);
    v33 = v33 & 0xFF00000000000000 | HIDWORD(height);
  }
  else
  {
    if ((v33 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "handleFailureInFunction:file:lineNumber:description:", v92, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v118);

      v33 = v118;
    }
    v34 = (v100 + v105) ^ __ROR8__(v105, 51);
    v35 = v110 + (v115 ^ height);
    v36 = __ROR8__(v115 ^ height, 48);
    v37 = (v35 ^ v36) + __ROR8__(v100 + v105, 32);
    v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
    v39 = v35 + v34;
    v111 = __ROR8__(v39, 32);
    v116 = v38;
    v101 = v37 ^ height;
    v106 = v39 ^ __ROR8__(v34, 47);
  }
  width = (unint64_t)self->_maxSupportedSize.width;
  v48 = v33 + 0x800000000000000;
  v119 = v48;
  if ((v48 & 0x400000000000000) != 0)
  {
    if ((v48 & 0x300000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "handleFailureInFunction:file:lineNumber:description:", v98, CFSTR("MSVHasher+SipHash.h"), 105, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 3]: %lld"), v119);

      v48 = v119;
    }
    v55 = v48 & 0xFFFFFFFFFFFFFFLL | (width << 32);
    v56 = (v101 + v106) ^ __ROR8__(v106, 51);
    v57 = v111 + (v55 ^ v116);
    v58 = __ROR8__(v55 ^ v116, 48);
    v59 = (v57 ^ v58) + __ROR8__(v101 + v106, 32);
    v60 = v59 ^ __ROR8__(v57 ^ v58, 43);
    v61 = v57 + v56;
    v112 = __ROR8__(v61, 32);
    v117 = v60;
    v102 = v59 ^ v55;
    v107 = v61 ^ __ROR8__(v56, 47);
    v48 = v48 & 0xFF00000000000000 | HIDWORD(width);
  }
  else
  {
    if ((v48 & 0x7FFFFFFFFFFFFFFLL) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MSVHasher_SipHash_1_3_Append64(MSVHasherSipHash_1_3 *, uint64_t)");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "handleFailureInFunction:file:lineNumber:description:", v94, CFSTR("MSVHasher+SipHash.h"), 101, CFSTR("_MSVHasher_SipHash_1_3_Append64: invalid byte count detected [byteCount & 7, tail == 0]: %lld"), v119);

      v48 = v119;
    }
    v49 = (v101 + v106) ^ __ROR8__(v106, 51);
    v50 = v111 + (v116 ^ width);
    v51 = __ROR8__(v116 ^ width, 48);
    v52 = (v50 ^ v51) + __ROR8__(v101 + v106, 32);
    v53 = v52 ^ __ROR8__(v50 ^ v51, 43);
    v54 = v50 + v49;
    v112 = __ROR8__(v54, 32);
    v117 = v53;
    v102 = v52 ^ width;
    v107 = v54 ^ __ROR8__(v49, 47);
  }
  v62 = (v102 + v107) ^ __ROR8__(v107, 51);
  v63 = v112 + (v117 ^ (v48 + 0x800000000000000));
  v64 = __ROR8__(v117 ^ (v48 + 0x800000000000000), 48);
  v65 = (v63 ^ v64) + __ROR8__(v102 + v107, 32);
  v66 = v65 ^ __ROR8__(v63 ^ v64, 43);
  v67 = v63 + v62;
  v68 = v67 ^ __ROR8__(v62, 47);
  v69 = (v65 ^ (v48 + 0x800000000000000)) + v68;
  v70 = v69 ^ __ROR8__(v68, 51);
  v71 = (__ROR8__(v67, 32) ^ 0xFFLL) + v66;
  v72 = __ROR8__(v66, 48);
  v73 = __ROR8__(v69, 32) + (v71 ^ v72);
  v74 = v73 ^ __ROR8__(v71 ^ v72, 43);
  v75 = v70 + v71;
  v76 = v75 ^ __ROR8__(v70, 47);
  v77 = v76 + v73;
  v78 = v77 ^ __ROR8__(v76, 51);
  v79 = __ROR8__(v75, 32) + v74;
  v80 = __ROR8__(v74, 48);
  v81 = __ROR8__(v77, 32) + (v79 ^ v80);
  v82 = v81 ^ __ROR8__(v79 ^ v80, 43);
  v83 = v78 + v79;
  v84 = v83 ^ __ROR8__(v78, 47);
  v85 = v84 + v81;
  v86 = v85 ^ __ROR8__(v84, 51);
  v87 = __ROR8__(v83, 32) + v82;
  v88 = __ROR8__(v82, 48);
  v89 = __ROR8__(v85, 32) + (v87 ^ v88);
  return (v86 + v87) ^ __ROR8__(v86, 47) ^ v89 ^ __ROR8__(v86 + v87, 32) ^ v89 ^ __ROR8__(v87 ^ v88, 43);
}

- (NSArray)supportedSizes
{
  return self->_supportedSizes;
}

- (void)setSupportedSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
