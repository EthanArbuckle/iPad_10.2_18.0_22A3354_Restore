@implementation VoiceMemosIntentHandler

- (id)handlerForIntent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  VoiceMemosIntentHandler *v7;

  v4 = a3;
  v5 = objc_opt_class(RecordVoiceMemoIntent);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    || (v6 = objc_opt_class(PlaybackVoiceMemoIntent), (objc_opt_isKindOfClass(v4, v6) & 1) != 0))
  {
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)handleRecordVoiceMemo:(id)a3 completion:(id)a4
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a4;
  v5 = objc_msgSend(objc_alloc((Class)RecordVoiceMemoIntentResponse), "_initWithCode:userActivity:", 2, 0);
  v4[2](v4, v5);

}

- (void)confirmRecordVoiceMemo:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000033F4;
  v7[3] = &unk_1000040E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "checkRecordingAvailability:", v7);

}

- (void)handlePlaybackVoiceMemo:(id)a3 completion:(id)a4
{
  void (**v4)(id, id);
  id v5;

  v4 = (void (**)(id, id))a4;
  v5 = objc_msgSend(objc_alloc((Class)PlaybackVoiceMemoIntentResponse), "_initWithCode:userActivity:", 2, 0);
  v4[2](v4, v5);

}

- (void)confirmPlaybackVoiceMemo:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RCSSavedRecordingService sharedService](RCSSavedRecordingService, "sharedService"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000035B4;
  v7[3] = &unk_1000040E8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "checkRecordingAvailability:", v7);

}

@end
