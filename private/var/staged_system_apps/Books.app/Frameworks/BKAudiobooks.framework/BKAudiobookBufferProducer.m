@implementation BKAudiobookBufferProducer

- (void)updateWithChapter:(id)a3 bufferedTrackPositions:(id)a4 bufferedTrackDurations:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  Float64 Seconds;
  Float64 v13;
  Float64 v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  Float64 v22;
  Float64 v23;
  Float64 v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime time;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && (v11 = objc_msgSend(v9, "count"), v11 == objc_msgSend(v10, "count")))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_20EC8;
    v47 = sub_20ED8;
    v48 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = sub_20EC8;
    v41 = sub_20ED8;
    v42 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_20EC8;
    v35 = sub_20ED8;
    v36 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v8, "timeRangeInTrack");
    time = v29;
    Seconds = CMTimeGetSeconds(&time);
    objc_msgSend(v8, "timeRangeInTrack");
    v28 = v27;
    v13 = CMTimeGetSeconds(&v28);
    objc_msgSend(v8, "timeRangeInAudiobook");
    v26 = v25;
    v14 = CMTimeGetSeconds(&v26);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_20EE0;
    v17[3] = &unk_392C0;
    v15 = v10;
    v18 = v15;
    v19 = &v43;
    v22 = Seconds;
    v23 = v13;
    v20 = &v31;
    v21 = &v37;
    v24 = v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v17);
    -[BKAudiobookBufferProducer setChapter:](self, "setChapter:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookBufferInfo infoWithAudiobookPositions:audiobookDurations:chapterPositions:chapterDurations:](BKAudiobookBufferInfo, "infoWithAudiobookPositions:audiobookDurations:chapterPositions:chapterDurations:", v38[5], v15, v44[5], v32[5]));
    -[BKAudiobookBufferProducer setBufferInfo:](self, "setBufferInfo:", v16);

    -[BKAudiobookBufferProducer setTrackPositions:](self, "setTrackPositions:", v9);
    -[BKAudiobookBufferProducer setTrackDurations:](self, "setTrackDurations:", v15);

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v37, 8);

    _Block_object_dispose(&v43, 8);
  }
  else
  {
    -[BKAudiobookBufferProducer setChapter:](self, "setChapter:", 0);
    -[BKAudiobookBufferProducer setBufferInfo:](self, "setBufferInfo:", 0);
    -[BKAudiobookBufferProducer setTrackPositions:](self, "setTrackPositions:", 0);
    -[BKAudiobookBufferProducer setTrackDurations:](self, "setTrackDurations:", 0);
  }

}

- (id)timeRemainingInBufferFromTrackPosition:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  _UNKNOWN **v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookBufferProducer bufferInfo](self, "bufferInfo"));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_20EC8;
  v18 = sub_20ED8;
  v19 = &off_3A188;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookBufferProducer trackPositions](self, "trackPositions"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_21164;
  v10[3] = &unk_392E8;
  v7 = v5;
  v13 = a3;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (BKAudiobookChapter)chapter
{
  return self->_chapter;
}

- (void)setChapter:(id)a3
{
  objc_storeStrong((id *)&self->_chapter, a3);
}

- (BKAudiobookBufferInfo)bufferInfo
{
  return self->_bufferInfo;
}

- (void)setBufferInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bufferInfo, a3);
}

- (NSArray)trackPositions
{
  return self->_trackPositions;
}

- (void)setTrackPositions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)trackDurations
{
  return self->_trackDurations;
}

- (void)setTrackDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackDurations, 0);
  objc_storeStrong((id *)&self->_trackPositions, 0);
  objc_storeStrong((id *)&self->_bufferInfo, 0);
  objc_storeStrong((id *)&self->_chapter, 0);
}

@end
