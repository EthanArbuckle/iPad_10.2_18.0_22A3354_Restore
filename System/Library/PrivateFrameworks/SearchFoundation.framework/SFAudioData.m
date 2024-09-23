@implementation SFAudioData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setSampleRate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sampleRate = a3;
}

- (BOOL)hasSampleRate
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFAudioData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAudioData *v6;
  SFAudioData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBAudioData initWithData:]([_SFPBAudioData alloc], "initWithData:", v5);
  v7 = -[SFAudioData initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBAudioData *v6;

  v4 = a3;
  v6 = -[_SFPBAudioData initWithFacade:]([_SFPBAudioData alloc], "initWithFacade:", self);
  -[_SFPBAudioData data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBAudioData *v2;
  void *v3;

  v2 = -[_SFPBAudioData initWithFacade:]([_SFPBAudioData alloc], "initWithFacade:", self);
  -[_SFPBAudioData dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBAudioData *v2;
  void *v3;

  v2 = -[_SFPBAudioData initWithFacade:]([_SFPBAudioData alloc], "initWithFacade:", self);
  -[_SFPBAudioData jsonData](v2, "jsonData");
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFAudioData audioBuffer](self, "audioBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setAudioBuffer:", v6);

  -[SFAudioData formatID](self, "formatID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFormatID:", v8);

  -[SFAudioData formatFlags](self, "formatFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setFormatFlags:", v10);

  -[SFAudioData sampleRate](self, "sampleRate");
  objc_msgSend(v4, "setSampleRate:");
  -[SFAudioData bitsPerChannel](self, "bitsPerChannel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setBitsPerChannel:", v12);

  -[SFAudioData bytesPerFrame](self, "bytesPerFrame");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBytesPerFrame:", v14);

  -[SFAudioData channelsPerFrame](self, "channelsPerFrame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setChannelsPerFrame:", v16);

  -[SFAudioData bytesPerPacket](self, "bytesPerPacket");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setBytesPerPacket:", v18);

  -[SFAudioData framesPerPacket](self, "framesPerPacket");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setFramesPerPacket:", v20);

  -[SFAudioData reserved](self, "reserved");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setReserved:", v22);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFAudioData *v4;
  SFAudioData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
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
  uint64_t v57;
  void *v58;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;

  v4 = (SFAudioData *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFAudioData isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = v4;
      -[SFAudioData audioBuffer](self, "audioBuffer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData audioBuffer](v5, "audioBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v6 == 0) == (v7 != 0))
      {
        v11 = 0;
LABEL_52:

        goto LABEL_53;
      }
      -[SFAudioData audioBuffer](self, "audioBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SFAudioData audioBuffer](self, "audioBuffer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData audioBuffer](v5, "audioBuffer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v83 = v10;
        v84 = v9;
      }
      -[SFAudioData formatID](self, "formatID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData formatID](v5, "formatID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v12 == 0) == (v13 != 0))
        goto LABEL_48;
      -[SFAudioData formatID](self, "formatID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[SFAudioData formatID](self, "formatID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData formatID](v5, "formatID");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v81 = v15;
        if (!objc_msgSend(v15, "isEqual:", v80))
        {
LABEL_46:

LABEL_47:
          goto LABEL_48;
        }
      }
      v82 = v14;
      -[SFAudioData formatFlags](self, "formatFlags");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData formatFlags](v5, "formatFlags");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_48:

          v11 = 0;
          if (!v8)
          {
LABEL_51:

            goto LABEL_52;
          }
          goto LABEL_49;
        }
        goto LABEL_46;
      }
      v77 = v16;
      v78 = v17;
      -[SFAudioData formatFlags](self, "formatFlags");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        -[SFAudioData formatFlags](self, "formatFlags");
        v18 = objc_claimAutoreleasedReturnValue();
        -[SFAudioData formatFlags](v5, "formatFlags");
        v19 = objc_claimAutoreleasedReturnValue();
        v76 = (void *)v18;
        v20 = (void *)v18;
        v16 = (void *)v19;
        if (!objc_msgSend(v20, "isEqual:", v19))
          goto LABEL_27;
      }
      -[SFAudioData sampleRate](self, "sampleRate");
      v22 = v21;
      -[SFAudioData sampleRate](v5, "sampleRate");
      if (vabdd_f64(v22, v23) >= 2.22044605e-16)
      {
        if (!v79)
          goto LABEL_45;
        goto LABEL_27;
      }
      v75 = v16;
      -[SFAudioData bitsPerChannel](self, "bitsPerChannel");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData bitsPerChannel](v5, "bitsPerChannel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v24 == 0) == (v25 != 0))
      {

        goto LABEL_44;
      }
      v72 = v25;
      v73 = v24;
      -[SFAudioData bitsPerChannel](self, "bitsPerChannel");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (v74)
      {
        -[SFAudioData bitsPerChannel](self, "bitsPerChannel");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData bitsPerChannel](v5, "bitsPerChannel");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v26;
        if (!objc_msgSend(v26, "isEqual:", v70))
          goto LABEL_42;
      }
      -[SFAudioData bytesPerFrame](self, "bytesPerFrame");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData bytesPerFrame](v5, "bytesPerFrame");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v27 == 0) == (v28 != 0))
      {

        goto LABEL_41;
      }
      v68 = v27;
      v69 = v28;
      -[SFAudioData bytesPerFrame](self, "bytesPerFrame");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        -[SFAudioData bytesPerFrame](self, "bytesPerFrame");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData bytesPerFrame](v5, "bytesPerFrame");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
LABEL_39:

LABEL_40:
LABEL_41:
          v14 = v82;
          if (!v74)
          {
LABEL_43:

LABEL_44:
            v16 = v75;
            if (!v79)
            {
LABEL_45:

              if (!v14)
                goto LABEL_48;
              goto LABEL_46;
            }
LABEL_27:

            goto LABEL_45;
          }
LABEL_42:

          goto LABEL_43;
        }
      }
      v67 = v29;
      -[SFAudioData channelsPerFrame](self, "channelsPerFrame");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData channelsPerFrame](v5, "channelsPerFrame");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v31 == 0) == (v32 != 0))
      {

        v29 = v67;
        if (!v67)
          goto LABEL_40;
        goto LABEL_39;
      }
      v63 = v32;
      -[SFAudioData channelsPerFrame](self, "channelsPerFrame");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (v64)
      {
        -[SFAudioData channelsPerFrame](self, "channelsPerFrame");
        v33 = objc_claimAutoreleasedReturnValue();
        -[SFAudioData channelsPerFrame](v5, "channelsPerFrame");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = (void *)v33;
        v34 = (void *)v33;
        v35 = v67;
        if (!objc_msgSend(v34, "isEqual:"))
          goto LABEL_60;
      }
      v62 = v31;
      -[SFAudioData bytesPerPacket](self, "bytesPerPacket");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData bytesPerPacket](v5, "bytesPerPacket");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v37 == 0) == (v38 != 0))
      {

        v35 = v67;
        v31 = v62;
        if (!v64)
        {
          v42 = v74;
LABEL_61:

          if (v35)
          {

          }
          v14 = v82;
          if (v42)
          {

          }
          if (v79)
          {

          }
          if (!v82)
            goto LABEL_47;
          goto LABEL_46;
        }
LABEL_60:
        v42 = v74;

        goto LABEL_61;
      }
      v58 = v38;
      v59 = v37;
      -[SFAudioData bytesPerPacket](self, "bytesPerPacket");
      v57 = objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        -[SFAudioData bytesPerPacket](self, "bytesPerPacket");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData bytesPerPacket](v5, "bytesPerPacket");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v39;
        if (!objc_msgSend(v39, "isEqual:"))
        {
          v11 = 0;
          v40 = v64;
          v41 = (void *)v57;
LABEL_84:

LABEL_85:
          if (v40)
          {

          }
          if (v67)
          {

          }
          if (v74)
          {

          }
          if (v79)
          {

          }
          if (v82)
          {

          }
          if (!v8)
            goto LABEL_51;
LABEL_49:
          v10 = v83;
          v9 = v84;
          goto LABEL_50;
        }
      }
      -[SFAudioData framesPerPacket](self, "framesPerPacket");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData framesPerPacket](v5, "framesPerPacket");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v43 == 0) == (v56 != 0))
      {

        v11 = 0;
        goto LABEL_83;
      }
      -[SFAudioData framesPerPacket](self, "framesPerPacket");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v53
        || (-[SFAudioData framesPerPacket](self, "framesPerPacket"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFAudioData framesPerPacket](v5, "framesPerPacket"),
            v51 = (void *)objc_claimAutoreleasedReturnValue(),
            v52 = v44,
            objc_msgSend(v44, "isEqual:")))
      {
        -[SFAudioData reserved](self, "reserved");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAudioData reserved](v5, "reserved");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v50 == 0) == (v49 != 0))
        {

          v11 = 0;
        }
        else
        {
          -[SFAudioData reserved](self, "reserved");
          v45 = objc_claimAutoreleasedReturnValue();
          if (v45)
          {
            v46 = (void *)v45;
            -[SFAudioData reserved](self, "reserved");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFAudioData reserved](v5, "reserved");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v48, "isEqual:", v47);

          }
          else
          {

            v11 = 1;
          }
        }
        if (!v53)
          goto LABEL_82;
      }
      else
      {
        v11 = 0;
      }

LABEL_82:
LABEL_83:
      v40 = v64;
      v41 = (void *)v57;
      if (!v57)
        goto LABEL_85;
      goto LABEL_84;
    }
    v11 = 0;
  }
LABEL_53:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  double v4;
  double v5;
  long double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  -[SFAudioData audioBuffer](self, "audioBuffer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v25, "hash");
  -[SFAudioData formatID](self, "formatID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v24, "hash") ^ v3;
  -[SFAudioData formatFlags](self, "formatFlags");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v23, "hash");
  -[SFAudioData sampleRate](self, "sampleRate");
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = round(v5);
  v20 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  -[SFAudioData bitsPerChannel](self, "bitsPerChannel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "hash");
  -[SFAudioData bytesPerFrame](self, "bytesPerFrame");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFAudioData channelsPerFrame](self, "channelsPerFrame");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SFAudioData bytesPerPacket](self, "bytesPerPacket");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[SFAudioData framesPerPacket](self, "framesPerPacket");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[SFAudioData reserved](self, "reserved");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22 ^ v21 ^ v19 ^ v9 ^ v11 ^ v13 ^ v15 ^ objc_msgSend(v16, "hash") ^ v20;

  return v17;
}

- (NSData)audioBuffer
{
  return self->_audioBuffer;
}

- (void)setAudioBuffer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)formatID
{
  return self->_formatID;
}

- (void)setFormatID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)formatFlags
{
  return self->_formatFlags;
}

- (void)setFormatFlags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (NSNumber)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (void)setBitsPerChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (void)setBytesPerFrame:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (void)setChannelsPerFrame:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (void)setBytesPerPacket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)framesPerPacket
{
  return self->_framesPerPacket;
}

- (void)setFramesPerPacket:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)reserved
{
  return self->_reserved;
}

- (void)setReserved:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_framesPerPacket, 0);
  objc_storeStrong((id *)&self->_bytesPerPacket, 0);
  objc_storeStrong((id *)&self->_channelsPerFrame, 0);
  objc_storeStrong((id *)&self->_bytesPerFrame, 0);
  objc_storeStrong((id *)&self->_bitsPerChannel, 0);
  objc_storeStrong((id *)&self->_formatFlags, 0);
  objc_storeStrong((id *)&self->_formatID, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

- (SFAudioData)initWithProtobuf:(id)a3
{
  id v4;
  SFAudioData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFAudioData *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFAudioData;
  v5 = -[SFAudioData init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "audioBuffer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "audioBuffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setAudioBuffer:](v5, "setAudioBuffer:", v7);

    }
    objc_msgSend(v4, "formatID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "formatID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setFormatID:](v5, "setFormatID:", v9);

    }
    if (objc_msgSend(v4, "formatFlags"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "formatFlags"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setFormatFlags:](v5, "setFormatFlags:", v10);

    }
    objc_msgSend(v4, "sampleRate");
    if (v11 != 0.0)
    {
      objc_msgSend(v4, "sampleRate");
      -[SFAudioData setSampleRate:](v5, "setSampleRate:");
    }
    if (objc_msgSend(v4, "bitsPerChannel"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "bitsPerChannel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setBitsPerChannel:](v5, "setBitsPerChannel:", v12);

    }
    if (objc_msgSend(v4, "bytesPerFrame"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "bytesPerFrame"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setBytesPerFrame:](v5, "setBytesPerFrame:", v13);

    }
    if (objc_msgSend(v4, "channelsPerFrame"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "channelsPerFrame"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setChannelsPerFrame:](v5, "setChannelsPerFrame:", v14);

    }
    if (objc_msgSend(v4, "bytesPerPacket"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "bytesPerPacket"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setBytesPerPacket:](v5, "setBytesPerPacket:", v15);

    }
    if (objc_msgSend(v4, "framesPerPacket"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "framesPerPacket"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setFramesPerPacket:](v5, "setFramesPerPacket:", v16);

    }
    if (objc_msgSend(v4, "reserved"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "reserved"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAudioData setReserved:](v5, "setReserved:", v17);

    }
    v18 = v5;
  }

  return v5;
}

@end
