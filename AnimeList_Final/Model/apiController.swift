//
//  apiController.swift
//  AnimeList_Final
//
//  Created by SaiRam Avala on 2021-12-03.
//

import Foundation
import UIKit

class apiController
{
    static var shared = apiController()
    
    func getDetailsFromAnimeList0(handler: @escaping ([animeListItems0])->Void)
    {
        let urlString = "https://api.simkl.com/anime"
        
        let urlObject = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: urlObject)
        { data , apiresponse , error in
            
            if let error = error
            {
                print(error.localizedDescription)
                handler([animeListItems0]())
            }
            
            // check response code
            else if let correct_data = data
            {
                do
                {
                    let decoder = JSONDecoder()
                        let resultFromDecoder = try decoder.decode(animeList.self,from: correct_data)
                    handler(resultFromDecoder.top_aired_fanarts)
                }catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    func getDetailsFromAnimeList1(handler: @escaping (animeListItems1)->Void)
    {
        let urlString = "https://api.simkl.com/anime"

        let urlObject = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlObject)
        { data , apiresponse , error in

            if let error = error
            {
                print(error)
            }

            // check response code
            else if let correct_data = data
            {
                do
                {
                    let decoder = JSONDecoder()
                        let resultFromDecoder = try decoder.decode(animeList.self,from: correct_data)
                    handler(resultFromDecoder.new_episodes)
                }catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    

    func getDetailsFromAnimeList2(handler: @escaping ([animeListItems2])->Void)
    {
        let urlString = "https://api.simkl.com/anime"

        let urlObject = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlObject)
        { data , apiresponse , error in

            if let error = error
            {
                print(error)
                handler([animeListItems2]())
            }

            // check response code
            else if let correct_data = data
            {
                do
                {
                    let decoder = JSONDecoder()
                        let resultFromDecoder = try decoder.decode(animeList.self,from: correct_data)
                        handler(resultFromDecoder.most_watched_this_month)
                }catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }


    func getDetailsFromAnimeList3(handler: @escaping ([animeListItems3])->Void)
    {
        let urlString = "https://api.simkl.com/anime"

        let urlObject = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlObject)
        { data , apiresponse , error in

            if let error = error
            {
                print(error)
                handler([animeListItems3]())
            }

            // check response code
            else if let correct_data = data
            {
                do
                {
                    let decoder = JSONDecoder()
                        let resultFromDecoder = try decoder.decode(animeList.self,from: correct_data)
                        handler(resultFromDecoder.top_last_aired)
                }catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }


    func getDetailsFromAnimeList4(handler: @escaping ([animeListItems4])->Void)
    {
        let urlString = "https://api.simkl.com/anime"

        let urlObject = URL(string: urlString)!

        let task = URLSession.shared.dataTask(with: urlObject)
        { data , apiresponse , error in

            if let error = error
            {
                print(error)
                handler([animeListItems4]())
            }

            // check response code
            else if let correct_data = data
            {
                do
                {
                    let decoder = JSONDecoder()
                        let resultFromDecoder = try decoder.decode(animeList.self,from: correct_data)
                        handler(resultFromDecoder.premieres)
                }catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    
    func getPoster(url : String, handler : @escaping (Result<UIImage,Error>)->Void)
    {
        let imgUrl = "https://simkl.in/posters/"+url+"_s.jpg"
        let urlObj = URL(string: imgUrl)!
        let task = URLSession.shared.dataTask(with: urlObj){
            data , URLResponse , Error
            in
            if let error = Error {
                print(error)
                handler(.failure(error))
                
            }
            else if let correct_data = data
            {
               let image = UIImage(data: correct_data)
                handler(.success(image!))
            }
        }
        task.resume()
    }
    
    func getPoster_highres(url : String, handler : @escaping (Result<UIImage,Error>)->Void)
    {
        let imgUrl = "https://simkl.in/posters/"+url+"_m.jpg"
        let urlObj = URL(string: imgUrl)!
        let task = URLSession.shared.dataTask(with: urlObj){
            data , URLResponse , Error
            in
            if let error = Error {
                print(error)
                handler(.failure(error))
                
            }
            else if let correct_data = data
            {
               let image = UIImage(data: correct_data)
                handler(.success(image!))
            }
        }
        task.resume()
    }
    
    
    func getArt_highres(url : String, handler : @escaping (Result<UIImage,Error>)->Void)
    {
        let imgUrl = "https://simkl.in/fanart/"+url+"_w.jpg"
        
        let urlObj = URL(string: imgUrl)!
        let task = URLSession.shared.dataTask(with: urlObj){
            data , URLResponse , Error
            in
            if let error = Error {
                print(error)
                handler(.failure(error))
                
            }
            else if let correct_data = data
            {
               let image = UIImage(data: correct_data)
                handler(.success(image!))
            }
        }
        task.resume()
    }
}
