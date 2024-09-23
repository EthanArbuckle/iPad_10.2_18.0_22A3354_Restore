@implementation PPLSpotlightFeedbackListener

- (void)didPerformCommand:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(v4, "command");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    +[SpotlightFeedbackListener didPerformCommand:](_TtC6People25SpotlightFeedbackListener, "didPerformCommand:", v4);

}

@end
