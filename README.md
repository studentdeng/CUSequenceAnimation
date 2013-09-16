CUSequenceAnimation
===================

序列图部分的动画封装，从plist中读取配置

#install

将podspec文件手动copy到cocoapod目录

	pod 'CUSequenceAnimation', '~>1.0' 
	
或是

	pod 'CUSequenceAnimation', :git => 'https://github.com/studentdeng/CUSequenceAnimation' 

#use

将每一个动画逻辑封装在一个子类中

	#import "CUAnimationManager.h"

	@interface MainBGCUAnimationManager : CUAnimationManager

	+ (CUAnimationManager *)managerWithImageView:(UIImageView *)imageView;

	@end


	@implementation MainBGCUAnimationManager

	+ (CUAnimationManager *)managerWithImageView:(UIImageView *)imageView
	{
    	CUAnimationManager *manager =
    	[CUAnimationManager animationSequenceWithBasename:@"main_bg"
                                        UIImageView:imageView
                                           andBegin:0
                                             andEnd:44
                                            andRate:24];
    	return manager;
	}

	@end