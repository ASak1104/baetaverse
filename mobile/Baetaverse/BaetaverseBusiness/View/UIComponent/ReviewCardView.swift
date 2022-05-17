//
//  ReviewCardView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct ReviewCardView: View {
    
    @Binding var review: ReviewEntity
    
    var body: some View {
        CardView {
            VStack {
                ReviewCardTitleView(title: $review.title, created: $review.created)
                ReviewCardHeaderView(rating: $review.rating, editor: $review.editor)
            }
            ReviewCardContentView(reviewText: $review.reviewText)
        }
    }
    
}

private struct ReviewCardTitleView: View {
    
    @Binding var title: String
    @Binding var created: Date
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(created.formatted())
        }
    }
    
}

private struct ReviewCardHeaderView: View {
    
    @Binding var rating: Int
    @Binding var editor: String
    
    var body: some View {
        HStack {
            StarRatingView(rating: $rating)
            Spacer()
            Text(editor)
        }
    }
    
}

private struct ReviewCardContentView: View {
    
    @Binding var reviewText: String
    
    var body: some View {
        Text(reviewText)
            .lineLimit(3)
    }
    
}

struct ReviewCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let review = ReviewEntity(
            id: 1,
            title: "안녕하세요",
            created: Date(),
            rating: 4,
            editor: "한정택",
            reviewText: "리뷰 남깁니다! 리뷰 카드가 잘 동작하고 있나요?"
        )
        ReviewCardView(review: .constant(review))
    }
    
}
