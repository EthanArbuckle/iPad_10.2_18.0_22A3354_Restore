@implementation SCUIHelpResources

+ (void)openChatWithParents
{
  +[SCUIContactParentsHelper openChatWithParentsForInterventionType:](SCUIContactParentsHelper, "openChatWithParentsForInterventionType:", +[SCUIHelpResources getCurrentInterventionType](SCUIHelpResources, "getCurrentInterventionType"));
}

+ (void)obtainChatWithParentsURL:(id)a3
{
  id v3;

  v3 = a3;
  +[SCUIContactParentsHelper obtainChatWithParentsURLForInterventionType:completionHandler:](SCUIContactParentsHelper, "obtainChatWithParentsURLForInterventionType:completionHandler:", +[SCUIHelpResources getCurrentInterventionType](SCUIHelpResources, "getCurrentInterventionType"), v3);

}

@end
