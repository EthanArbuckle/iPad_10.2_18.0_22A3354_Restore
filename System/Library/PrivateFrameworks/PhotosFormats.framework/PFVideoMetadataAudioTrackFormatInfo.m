@implementation PFVideoMetadataAudioTrackFormatInfo

- (int64_t)channelCount
{
  const AudioFormatListItem *formatListItem;

  formatListItem = self->_formatListItem;
  if (formatListItem)
    return formatListItem->mASBD.mChannelsPerFrame;
  else
    return 0;
}

- (BOOL)channelLayoutUsesChannelDescriptions
{
  const AudioChannelLayout *channelLayout;

  channelLayout = self->_channelLayout;
  return channelLayout && channelLayout->mChannelLayoutTag == 0;
}

- (BOOL)channelLayoutUsesHOA
{
  const AudioChannelLayout *channelLayout;

  channelLayout = self->_channelLayout;
  return channelLayout && (channelLayout->mChannelLayoutTag & 0xFFFE0000) == 12451840;
}

- (BOOL)getHOAChannelCount:(int64_t *)a3 BEDChannelCount:(int64_t *)a4
{
  const AudioChannelLayout *channelLayout;
  uint64_t mNumberChannelDescriptions;
  uint64_t v9;
  int64_t v10;
  AudioChannelDescription *mChannelDescriptions;
  AudioChannelLabel mChannelLabel;
  _BOOL4 v13;
  unsigned int v14;
  uint64_t v15;
  _BOOL4 v16;

  *a3 = 0;
  *a4 = 0;
  if (-[PFVideoMetadataAudioTrackFormatInfo channelLayoutUsesChannelDescriptions](self, "channelLayoutUsesChannelDescriptions"))
  {
    channelLayout = self->_channelLayout;
    mNumberChannelDescriptions = channelLayout->mNumberChannelDescriptions;
    if ((_DWORD)mNumberChannelDescriptions)
    {
      v9 = 0;
      v10 = 0;
      mChannelDescriptions = channelLayout->mChannelDescriptions;
      do
      {
        mChannelLabel = mChannelDescriptions->mChannelLabel;
        ++mChannelDescriptions;
        v13 = (mChannelLabel & 0xFFFF0000) != 0x10000;
        v14 = mChannelLabel & 0xFFFE0000;
        if ((mChannelLabel & 0xFFFF0000) == 0x10000)
          ++v9;
        v15 = v14 == 0x20000 && v13;
        v10 += v15;
        --mNumberChannelDescriptions;
      }
      while (mNumberChannelDescriptions);
      if (v10)
        *a3 = v10;
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
    *a4 = -[PFVideoMetadataAudioTrackFormatInfo channelCount](self, "channelCount") - (v9 + v10);
    goto LABEL_16;
  }
  v16 = -[PFVideoMetadataAudioTrackFormatInfo channelLayoutUsesHOA](self, "channelLayoutUsesHOA");
  if (v16)
  {
    *a3 = self->_channelLayout->mChannelLayoutTag;
LABEL_16:
    LOBYTE(v16) = 1;
  }
  return v16;
}

- (BOOL)channelLayoutUsesHigherOrderAmbisonics
{
  return self->_channelLayoutUsesHigherOrderAmbisonics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTrack, 0);
}

+ (id)infoForFirstAudioTrackOfAsset:(id)a3 matchingCodecPredicate:(id)a4
{
  id v5;
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  const opaqueCMFormatDescription *v18;
  uint64_t MediaSubType;
  uint64_t v20;
  const AudioFormatListItem *RichestDecodableFormat;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int (**)(id, _QWORD))a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  +[PFMediaUtilities tracksWithMediaType:forAsset:](PFMediaUtilities, "tracksWithMediaType:forAsset:", *MEMORY[0x1E0C8A7A0], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v23 = *(_QWORD *)v30;
    v24 = v5;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v12, "formatDescriptions", v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v18 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v25 + 1) + 8 * j);
              MediaSubType = CMFormatDescriptionGetMediaSubType(v18);
              if (v6[2](v6, MediaSubType))
              {
                v20 = objc_opt_new();
                objc_storeStrong((id *)(v20 + 8), v12);
                *(_QWORD *)(v20 + 16) = v18;
                RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(v18);
                *(_QWORD *)(v20 + 24) = RichestDecodableFormat;
                v5 = v24;
                if (!RichestDecodableFormat && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v34 = v24;
                  _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get richest decodable audio format for asset %@", buf, 0xCu);
                }
                *(_QWORD *)(v20 + 32) = CMAudioFormatDescriptionGetChannelLayout(*(CMAudioFormatDescriptionRef *)(v20 + 16), 0);

                goto LABEL_22;
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
            if (v15)
              continue;
            break;
          }
        }

        v10 = v23;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      v20 = 0;
      v5 = v24;
    }
    while (v9);
  }
  else
  {
    v20 = 0;
  }
LABEL_22:

  return (id)v20;
}

@end
