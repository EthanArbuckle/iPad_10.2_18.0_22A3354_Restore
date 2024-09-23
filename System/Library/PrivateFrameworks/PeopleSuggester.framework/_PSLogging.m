@implementation _PSLogging

+ (id)messagePinningChannel
{
  if (messagePinningChannel_onceToken != -1)
    dispatch_once(&messagePinningChannel_onceToken, &__block_literal_global_2);
  return (id)messagePinningChannel_messagePinningChannel;
}

+ (id)generalChannel
{
  if (generalChannel_onceToken != -1)
    dispatch_once(&generalChannel_onceToken, &__block_literal_global_1);
  return (id)generalChannel_generalChannel;
}

+ (id)familyRecommenderChannel
{
  if (familyRecommenderChannel_onceToken != -1)
    dispatch_once(&familyRecommenderChannel_onceToken, &__block_literal_global_4);
  return (id)familyRecommenderChannel_generalChannel;
}

+ (id)heuristicsChannel
{
  if (heuristicsChannel_onceToken != -1)
    dispatch_once(&heuristicsChannel_onceToken, &__block_literal_global_6);
  return (id)heuristicsChannel_heuristicsChannel;
}

+ (id)coreBehaviorChannel
{
  if (coreBehaviorChannel_onceToken != -1)
    dispatch_once(&coreBehaviorChannel_onceToken, &__block_literal_global_8);
  return (id)coreBehaviorChannel_coreBehaviorChannel;
}

+ (id)knnChannel
{
  if (knnChannel_onceToken != -1)
    dispatch_once(&knnChannel_onceToken, &__block_literal_global_10);
  return (id)knnChannel_knnChannel;
}

+ (id)feedbackChannel
{
  if (feedbackChannel_onceToken != -1)
    dispatch_once(&feedbackChannel_onceToken, &__block_literal_global_12);
  return (id)feedbackChannel_feedbackChannel;
}

+ (id)shareExtensionChannel
{
  if (shareExtensionChannel_onceToken != -1)
    dispatch_once(&shareExtensionChannel_onceToken, &__block_literal_global_14);
  return (id)shareExtensionChannel_shareExtensionChannel;
}

+ (id)mediaAnalysisChannel
{
  if (mediaAnalysisChannel__pasOnceToken10 != -1)
    dispatch_once(&mediaAnalysisChannel__pasOnceToken10, &__block_literal_global_16);
  return (id)mediaAnalysisChannel_mediaAnalysisChannel;
}

+ (id)contactEmbeddingChannel
{
  if (contactEmbeddingChannel_onceToken != -1)
    dispatch_once(&contactEmbeddingChannel_onceToken, &__block_literal_global_18);
  return (id)contactEmbeddingChannel_contactEmbeddingChannel;
}

+ (id)featureGenerationChannel
{
  if (featureGenerationChannel_onceToken != -1)
    dispatch_once(&featureGenerationChannel_onceToken, &__block_literal_global_20);
  return (id)featureGenerationChannel_featureGenerationChannel;
}

+ (id)rewriteChannel
{
  if (rewriteChannel_onceToken != -1)
    dispatch_once(&rewriteChannel_onceToken, &__block_literal_global_22);
  return (id)rewriteChannel_rewriteChannel;
}

+ (id)suggestionSignpost
{
  if (suggestionSignpost_onceToken != -1)
    dispatch_once(&suggestionSignpost_onceToken, &__block_literal_global_24);
  return (id)suggestionSignpost_suggestionSignpost;
}

@end
