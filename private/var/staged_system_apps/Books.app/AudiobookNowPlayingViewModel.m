@implementation AudiobookNowPlayingViewModel

- (_TtC5Books28AudiobookNowPlayingViewModel)init
{
  return (_TtC5Books28AudiobookNowPlayingViewModel *)sub_1001EF854();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t);
  void (*v40)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__absolutePlayedInterval;
  v4 = sub_10004CFD4((uint64_t *)&unk_1009D4E40);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__artwork;
  v7 = sub_10004CFD4(&qword_1009D19F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__assetID;
  v9 = sub_10004CFD4(&qword_1009D19E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__audiobookTitle;
  v11 = sub_10004CFD4(&qword_1009D19E0);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__authorName, v11);
  v39 = v12;
  v13 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__backgroundColorClosure;
  v14 = sub_10004CFD4(&qword_1009D4E10);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__bufferedProportion, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapterPlayedProportion, v4);
  v12((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapterTitle, v11);
  v15 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__currentChapterIndex;
  v16 = sub_10004CFD4((uint64_t *)&unk_1009D19D0);
  v17 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8);
  v17(v15, v16);
  v18 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__downloadProgress;
  v19 = sub_10004CFD4(&qword_1009D19C8);
  v20 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8);
  v20(v18, v19);
  v21 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__downloadState;
  v22 = sub_10004CFD4(&qword_1009D19C0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
  v23 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isFirstEverLaunch;
  v24 = sub_10004CFD4((uint64_t *)&unk_1009D4E70);
  v40 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8);
  v40(v23, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isLoadingResources, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isPlaying, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isPreview, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isScrubbing, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isSkipping, v24);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isStalling, v24);
  v17((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__listeningSessionStartChapterIndex, v16);
  v20((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__listeningSessionStartTimeProportion, v19);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__multipleRoutes, v24);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skipBackwardInterval, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skipForwardInterval, v4);
  v25 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playButtonState;
  v26 = sub_10004CFD4((uint64_t *)&unk_1009D19B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(v25, v26);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playedInterval, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__skippingCumulativeDelta, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerInitialDuration, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerRemainingTime, v4);
  v27 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__playbackRate;
  v28 = sub_10004CFD4(&qword_1009D19A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);
  v39((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__widestRateString, v11);
  v5((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__toPlayInterval, v4);
  v29 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__volume;
  v30 = sub_10004CFD4(&qword_1009D19A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v29, v30);
  v31 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__buyButtonProvider;
  v32 = sub_10004CFD4((uint64_t *)&unk_1009DC000);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(v31, v32);
  v33 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__sleepTimerSelectedOption;
  v34 = sub_10004CFD4((uint64_t *)&unk_1009D1990);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v34 - 8) + 8))(v33, v34);
  v35 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__chapters;
  v36 = sub_10004CFD4(&qword_1009D1988);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v35, v36);
  v37 = (char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__supplementalContents;
  v38 = sub_10004CFD4(&qword_1009D1980);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v38 - 8) + 8))(v37, v38);
  v40((char *)self + OBJC_IVAR____TtC5Books28AudiobookNowPlayingViewModel__isSG, v24);
}

@end
