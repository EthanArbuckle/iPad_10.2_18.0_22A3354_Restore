@implementation PLAssetComputeSyncPayloadWrapper

- (void)setAssetPayloadVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_assetPayloadVersion = a3;
}

- (void)setHasAssetPayloadVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetPayloadVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasAssetPayload
{
  return self->_assetPayload != 0;
}

- (BOOL)hasMediaAnalysisPayload
{
  return self->_mediaAnalysisPayload != 0;
}

- (BOOL)hasDeviceBuild
{
  return self->_deviceBuild != 0;
}

- (BOOL)hasDeviceHwModel
{
  return self->_deviceHwModel != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)PLAssetComputeSyncPayloadWrapper;
  -[PLAssetComputeSyncPayloadWrapper description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetComputeSyncPayloadWrapper dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *assetPayload;
  NSData *mediaAnalysisPayload;
  NSString *deviceBuild;
  NSString *deviceHwModel;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_assetPayloadVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("assetPayloadVersion"));

  }
  assetPayload = self->_assetPayload;
  if (assetPayload)
    objc_msgSend(v3, "setObject:forKey:", assetPayload, CFSTR("assetPayload"));
  mediaAnalysisPayload = self->_mediaAnalysisPayload;
  if (mediaAnalysisPayload)
    objc_msgSend(v3, "setObject:forKey:", mediaAnalysisPayload, CFSTR("mediaAnalysisPayload"));
  deviceBuild = self->_deviceBuild;
  if (deviceBuild)
    objc_msgSend(v3, "setObject:forKey:", deviceBuild, CFSTR("deviceBuild"));
  deviceHwModel = self->_deviceHwModel;
  if (deviceHwModel)
    objc_msgSend(v3, "setObject:forKey:", deviceHwModel, CFSTR("deviceHwModel"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PLAssetComputeSyncPayloadWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_assetPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_mediaAnalysisPayload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_deviceBuild)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceHwModel)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_assetPayloadVersion;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v5 = v4;
  if (self->_assetPayload)
  {
    objc_msgSend(v4, "setAssetPayload:");
    v4 = v5;
  }
  if (self->_mediaAnalysisPayload)
  {
    objc_msgSend(v5, "setMediaAnalysisPayload:");
    v4 = v5;
  }
  if (self->_deviceBuild)
  {
    objc_msgSend(v5, "setDeviceBuild:");
    v4 = v5;
  }
  if (self->_deviceHwModel)
  {
    objc_msgSend(v5, "setDeviceHwModel:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_assetPayloadVersion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_assetPayload, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSData copyWithZone:](self->_mediaAnalysisPayload, "copyWithZone:", a3);
  v10 = (void *)v6[5];
  v6[5] = v9;

  v11 = -[NSString copyWithZone:](self->_deviceBuild, "copyWithZone:", a3);
  v12 = (void *)v6[3];
  v6[3] = v11;

  v13 = -[NSString copyWithZone:](self->_deviceHwModel, "copyWithZone:", a3);
  v14 = (void *)v6[4];
  v6[4] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *assetPayload;
  NSData *mediaAnalysisPayload;
  NSString *deviceBuild;
  NSString *deviceHwModel;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_assetPayloadVersion != *((_DWORD *)v4 + 4))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  assetPayload = self->_assetPayload;
  if ((unint64_t)assetPayload | *((_QWORD *)v4 + 1)
    && !-[NSData isEqual:](assetPayload, "isEqual:"))
  {
    goto LABEL_15;
  }
  mediaAnalysisPayload = self->_mediaAnalysisPayload;
  if ((unint64_t)mediaAnalysisPayload | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](mediaAnalysisPayload, "isEqual:"))
      goto LABEL_15;
  }
  deviceBuild = self->_deviceBuild;
  if ((unint64_t)deviceBuild | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](deviceBuild, "isEqual:"))
      goto LABEL_15;
  }
  deviceHwModel = self->_deviceHwModel;
  if ((unint64_t)deviceHwModel | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](deviceHwModel, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_assetPayloadVersion;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_assetPayload, "hash") ^ v3;
  v5 = -[NSData hash](self->_mediaAnalysisPayload, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_deviceBuild, "hash");
  return v6 ^ -[NSString hash](self->_deviceHwModel, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[12] & 1) != 0)
  {
    self->_assetPayloadVersion = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[PLAssetComputeSyncPayloadWrapper setAssetPayload:](self, "setAssetPayload:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[PLAssetComputeSyncPayloadWrapper setMediaAnalysisPayload:](self, "setMediaAnalysisPayload:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PLAssetComputeSyncPayloadWrapper setDeviceBuild:](self, "setDeviceBuild:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[PLAssetComputeSyncPayloadWrapper setDeviceHwModel:](self, "setDeviceHwModel:");
    v4 = v5;
  }

}

- (unsigned)assetPayloadVersion
{
  return self->_assetPayloadVersion;
}

- (NSData)assetPayload
{
  return self->_assetPayload;
}

- (void)setAssetPayload:(id)a3
{
  objc_storeStrong((id *)&self->_assetPayload, a3);
}

- (NSData)mediaAnalysisPayload
{
  return self->_mediaAnalysisPayload;
}

- (void)setMediaAnalysisPayload:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAnalysisPayload, a3);
}

- (NSString)deviceBuild
{
  return self->_deviceBuild;
}

- (void)setDeviceBuild:(id)a3
{
  objc_storeStrong((id *)&self->_deviceBuild, a3);
}

- (NSString)deviceHwModel
{
  return self->_deviceHwModel;
}

- (void)setDeviceHwModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceHwModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAnalysisPayload, 0);
  objc_storeStrong((id *)&self->_deviceHwModel, 0);
  objc_storeStrong((id *)&self->_deviceBuild, 0);
  objc_storeStrong((id *)&self->_assetPayload, 0);
}

@end
