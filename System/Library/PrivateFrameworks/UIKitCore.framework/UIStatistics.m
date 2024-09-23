@implementation UIStatistics

uint64_t __72___UIStatistics_UICommonStatisticsGathering__previewInteractionTapCount__block_invoke()
{
  _UIStatisticsScalar *v0;
  void *v1;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.tap.count"), 2);
  v1 = (void *)qword_1ECD82048;
  qword_1ECD82048 = (uint64_t)v0;

  return objc_msgSend((id)qword_1ECD82048, "setSampleRate:", 0.0);
}

void __109___UIStatistics_UICommonStatisticsGathering___sharedStatisticWithDomain_statisticsClass_identifierReporting___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD820C0;
  qword_1ECD820C0 = v0;

}

void __73___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekCount__block_invoke()
{
  _UIStatisticsScalar *v0;
  void *v1;
  _UIStatisticsScalar *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.count"), 2);
  v1 = (void *)qword_1ECD82018;
  qword_1ECD82018 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.count.all"), 1);
  objc_msgSend((id)qword_1ECD82018, "_addChildStatistic:", v2);

}

void __76___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekDuration__block_invoke()
{
  _UIStatisticsDistribution *v0;
  void *v1;
  _UIStatisticsDistribution *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.duration"), 2);
  v1 = (void *)qword_1ECD82028;
  qword_1ECD82028 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.duration.all"), 1);
  objc_msgSend((id)qword_1ECD82028, "_addChildStatistic:", v2);

}

void __72___UIStatistics_UICommonStatisticsGathering__previewInteractionPopCount__block_invoke()
{
  _UIStatisticsScalar *v0;
  void *v1;
  _UIStatisticsScalar *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.pop.count"), 2);
  v1 = (void *)qword_1ECD82038;
  qword_1ECD82038 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.pop.count.all"), 1);
  objc_msgSend((id)qword_1ECD82038, "_addChildStatistic:", v2);

}

void __86___UIStatistics_UICommonStatisticsGathering__previewInteractionAlertPresentationCount__block_invoke()
{
  _UIStatisticsScalar *v0;
  void *v1;
  _UIStatisticsScalar *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.alert.count"), 2);
  v1 = (void *)qword_1ECD82058;
  qword_1ECD82058 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.alert.count.all"), 1);
  objc_msgSend((id)qword_1ECD82058, "_addChildStatistic:", v2);

}

void __73___UIStatistics_UICommonStatisticsGathering__previewInteractionPeekForce__block_invoke()
{
  _UIStatisticsDistribution *v0;
  void *v1;
  _UIStatisticsDistribution *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.force"), 0);
  v1 = (void *)qword_1ECD82068;
  qword_1ECD82068 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.peek.force.all"), 1);
  objc_msgSend((id)qword_1ECD82068, "_addChildStatistic:", v2);

}

void __72___UIStatistics_UICommonStatisticsGathering__previewInteractionPopForce__block_invoke()
{
  _UIStatisticsDistribution *v0;
  void *v1;
  _UIStatisticsDistribution *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.pop.force"), 0);
  v1 = (void *)qword_1ECD82078;
  qword_1ECD82078 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.peekAndPop.pop.force.all"), 1);
  objc_msgSend((id)qword_1ECD82078, "_addChildStatistic:", v2);

}

void __54___UIStatistics_UICommonStatisticsGathering__maxForce__block_invoke()
{
  _UIStatisticsDistribution *v0;
  void *v1;
  _UIStatisticsDistribution *v2;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.forceTouch.maxForce"), 0);
  v1 = (void *)qword_1ECD82088;
  qword_1ECD82088 = (uint64_t)v0;

  v2 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("UIKit.forceTouch.maxForce.all"), 1);
  objc_msgSend((id)qword_1ECD82088, "_addChildStatistic:", v2);
  objc_msgSend((id)qword_1ECD82088, "setSampleRate:", 0.01);
  objc_msgSend((id)qword_1ECD82088, "randomizeSampleValue");

}

void __64___UIStatistics_UICommonStatisticsGathering__scrubberUsageCount__block_invoke()
{
  _UIStatisticsScalar *v0;
  void *v1;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsScalar alloc], "initWithDomain:identifierReporting:", CFSTR("mediacontroller.UIMovieScrubber.ScrubberInteraction.count"), 0);
  v1 = (void *)qword_1ECD82098;
  qword_1ECD82098 = (uint64_t)v0;

}

void __63___UIStatistics_UICommonStatisticsGathering__scrubberUsageTime__block_invoke()
{
  _UIStatisticsDistribution *v0;
  void *v1;

  v0 = -[_UIStatistics initWithDomain:identifierReporting:]([_UIStatisticsDistribution alloc], "initWithDomain:identifierReporting:", CFSTR("mediacontroller.UIMovieScrubber.ScrubberInteraction.duration"), 0);
  v1 = (void *)qword_1ECD820A8;
  qword_1ECD820A8 = (uint64_t)v0;

}

@end
