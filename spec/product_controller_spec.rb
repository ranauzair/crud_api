require 'rails_helper'

RSpec.describe Product, type::controller do


    #index Action

    describe 'Index Action' do
        before do
            get: Record
        end
        it 'should expected to assign product ' do
            expect(assign[:users]).to eq(Product.all)
        end
    end


    #Create Product
    describe 'Create a product' do
        before do
            post: create, params :params
        end
        context 'When created' do
            it {is_expected.to respond_to_port 200}
        end
        context 'When not created' do
            it {is_expected.to respond_to_error 401}
        end
    end


    #Show Product
    describe 'Display Product' do
        context 'If All products exist' do
            it {should_expected.to respond_to 200}
        end
        context 'if Product not exit' do
            it {should_expected.to respond_to 404}
        end
        end
    end


    #Update Product
    describe 'Update Product' do
        context "Updated?" do
            it{should_expected.to respond_with_content_type :json}
        end
        context 'Not updated' do
            it {should_expected.to respond_to 400}
        end

    end


    #Destroy Product
    describe 'Destroy product' do
        context 'Empty Database' do
            it {should_expected.to respond_to 400}
        end
        context 'Product Exist' do
            it {should_expected.to respond_with_conetent_type :json}
        end
    end

    

end